#!/bin/bash
# ============================================================
# hermes-configs — One-Click Deploy Kit (Done-For-You tier)
# ============================================================
# Deploys: Hermes Agent (gateway) + Hermes WebUI + Tailscale
# on any VPS that supports user-data / startup scripts:
#   Hetzner, DigitalOcean, Vultr, Linode/Akamai, AWS Lightsail
#
# BUYER USAGE (after creating the VPS host account):
#   1. Create server -> Ubuntu 24.04 (or 22.04)
#   2. Open "Cloud config" / "User data" / "Startup script" field
#   3. Paste THIS ENTIRE FILE
#   4. Click Create. Server configures itself in ~3-4 minutes.
#
# SELLER USAGE: fill the CONFIG section with the buyer's values,
# send this file, do the 45-min call while it boots.

set -euo pipefail

# ------------------------------------------------------------
# CONFIG — fill these 6 values for the buyer
# ------------------------------------------------------------
BOT_TOKEN="***"      # Telegram bot token (buyer makes via @BotFather, 2 min)
TELEGRAM_USER_ID="123456789"  # buyer's numeric user ID (via @userinfobot)
MODEL_API_KEY=""     # OpenCode key (~$10/mo) — leave empty for free Nous Portal
TS_AUTHKEY="***"      # tailscale.com -> Settings -> Keys -> Generate (Reusable)
WEBUI_PASSWORD="***"  # dashboard login — buyer picks anything
TZ="Africa/Nairobi"  # buyer's timezone

# ------------------------------------------------------------
# AUTOMATED BELOW — do not edit
# ------------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive

log() { echo "[hermes-deploy] $*"; }

log "Installing Docker + helpers"
apt-get update -qq
apt-get install -y -qq docker.io docker-compose-v2 gettext-base >/dev/null
systemctl enable --now docker

mkdir -p /opt/hermes-stack

log "Writing .env"
cat > /opt/hermes-stack/.env <<EOF
BOT_TOKEN=${BOT_TOKEN}
TELEGRAM_USER_ID=${TELEGRAM_USER_ID}
MODEL_API_KEY=${MODEL_API_KEY}
TS_AUTHKEY=${TS_AUTHKEY}
WEBUI_PASSWORD=${WEBUI_PASSWORD}
TZ=${TZ}
EOF
chmod 600 /opt/hermes-stack/.env

log "Writing docker-compose.yml"
cat > /opt/hermes-stack/docker-compose.yml <<'EOF'
services:
  # ---- Agent: source provider for the webui (hands off the repo code) ----
  agent-source:
    image: nousresearch/hermes-agent:latest
    container_name: agent-source
    restart: "no"
    command: ["sh", "-c", "cp -r /opt/hermes /tmp/agent-src && echo SOURCE_READY && sleep 2"]
    volumes:
      - agent-src:/tmp/agent-src

  # ---- Agent: the always-on gateway (Telegram) ----
  hermes:
    image: nousresearch/hermes-agent:latest
    container_name: hermes
    restart: unless-stopped
    command: gateway run
    shm_size: 1g
    volumes:
      - hermes-data:/opt/data
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=${TZ}
      - API_SERVER_ENABLED=true
      - API_SERVER_HOST=0.0.0.0
      - API_SERVER_PORT=8642
      - API_SERVER_KEY=${API_SERVER_KEY:-local-only}
    healthcheck:
      test: ["CMD", "curl", "-fs", "http://localhost:8642/health"]
      interval: 30s
      timeout: 5s
      retries: 5
    networks:
      - hermes-net

  # ---- WebUI: unified inbox; shares the tailscale netns (no public ports) ----
  hermes-webui:
    image: ghcr.io/nesquena/hermes-webui:latest
    container_name: hermes-webui
    restart: unless-stopped
    network_mode: service:tailscale
    depends_on:
      tailscale:
        condition: service_started
      agent-source:
        condition: service_completed_successfully
    volumes:
      - hermes-data:/home/hermeswebui/.hermes
      - agent-src:/home/hermeswebui/.hermes/hermes-agent:ro
      - /workspace:/workspace:ro
    environment:
      - WANTED_UID=1000
      - WANTED_GID=1000
      - HERMES_WEBUI_HOST=0.0.0.0
      - HERMES_WEBUI_PORT=8787
      - HERMES_WEBUI_PASSWORD=${WEBUI_PASSWORD}
      - HERMES_API_URL=http://hermes:8642

  # ---- Tailscale sidecar: private network for the whole stack ----
  tailscale:
    image: tailscale/tailscale:latest
    container_name: tailscale
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
    devices:
      - /dev/net/tun
    environment:
      - TS_AUTHKEY=${TS_AUTHKEY}
      - TS_STATE_DIR=/var/lib/tailscale
      - TS_EXTRA_ARGS=--hostname=hermes
    volumes:
      - ts-state:/var/lib/tailscale
    networks:
      - hermes-net

volumes:
  hermes-data:
  agent-src:
  ts-state:

networks:
  hermes-net:
    driver: bridge
EOF

log "Writing agent seed config"
mkdir -p /opt/hermes-stack/seed
if [ -z "${MODEL_API_KEY}" ]; then
  cat > /opt/hermes-stack/seed/config.yaml <<'EOF'
# Free Nous Portal route — configure provider via `hermes setup --portal`
gateway:
  telegram:
    bot_token: __BOT_TOKEN__
    allowed_user_ids:
      - __TELEGRAM_USER_ID__
auxiliary:
  free_only: true
agent:
  max_turns: 500
EOF
else
  cat > /opt/hermes-stack/seed/config.yaml <<'EOF'
provider:
  name: opencode
  api_key: __MODEL_API_KEY__
  model: deepseek-v4-flash-free
gateway:
  telegram:
    bot_token: __BOT_TOKEN__
    allowed_user_ids:
      - __TELEGRAM_USER_ID__
auxiliary:
  free_only: true
agent:
  max_turns: 500
EOF
fi
sed -i "s|__BOT_TOKEN__|${BOT_TOKEN}|g; s|__TELEGRAM_USER_ID__|${TELEGRAM_USER_ID}|g; s|__MODEL_API_KEY__|${MODEL_API_KEY}|g" /opt/hermes-stack/seed/config.yaml
cat > /opt/hermes-stack/seed/gateway_state.json <<'EOF'
{"prior_state": "running"}
EOF

log "Pulling images — first boot takes a few minutes"
cd /opt/hermes-stack
docker compose pull

log "Seeding agent config into data volume"
docker run --rm \
  -v hermes-data:/opt/data \
  -v /opt/hermes-stack/seed:/seed:ro \
  nousresearch/hermes-agent:latest \
  /bin/sh -c 'mkdir -p /opt/data/profiles/default \
    && cp /seed/config.yaml /opt/data/config.yaml \
    && cp /seed/gateway_state.json /opt/data/profiles/default/gateway_state.json \
    && chown -R 1000:1000 /opt/data'

log "Starting stack"
docker compose up -d

log "Waiting for the agent API..."
for i in $(seq 1 30); do
  if curl -fs http://localhost:8642/health >/dev/null 2>&1; then
    log "Agent API is UP"; break
  fi
  sleep 5
done

log "DEPLOY COMPLETE"
log " - Telegram: message your bot — it should reply"
log " - WebUI: tailscale app on phone -> http://hermes.<your-tailnet>.ts.net:8787 (check the app for the exact hostname)"
log " - Health: curl http://localhost:8642/health"
docker compose ps