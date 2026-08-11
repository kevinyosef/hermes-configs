# Deploy Kit — One-Click Hermes + WebUI + Tailscale

**For the Done-For-You tier.** Turns the $150 setup into: buyer creates a VPS,
pastes one file, done. Works on **Hetzner, DigitalOcean, Vultr, Linode/Akamai,
AWS Lightsail** — any host with a user-data / startup-script field.

## What the buyer does

1. Create account on Hetzner/DigitalOcean/Vultr
2. **Create Server** → Ubuntu 24.04 (or 22.04)
3. Open the **"Cloud config"** (Hetzner) / **"User data"** (DO) /
   **"Startup script"** (Vultr) field
4. Paste the entire `bootstrap.sh` — then click **Create**

Server self-configures in ~3-4 minutes: Docker installs, images pull,
config seeds, gateway starts, Tailscale joins their tailnet.

## What you do as the seller

1. Fill the 6 values in the **CONFIG** section at the top of `bootstrap.sh`:

| Var | Where the buyer gets it | Time |
|-----|------------------------|------|
| `BOT_TOKEN` | Telegram → @BotFather → `/newbot` | 2 min |
| `TELEGRAM_USER_ID` | Telegram → @userinfobot → your ID | 1 min |
| `MODEL_API_KEY` | Leave empty → free Nous Portal; or OpenCode (~$10/mo) | — |
| `TS_AUTHKEY` | tailscale.com → Settings → Keys → **Generate** → *Reusable* | 2 min |
| `WEBUI_PASSWORD` | Buyer picks anything | 1 min |
| `TZ` | Buyer's timezone | — |

2. Send the filled file to the buyer with 2 instructions:
   * paste into user-data field
   * install Tailscale app on phone, sign in to the same account

3. 45-min call: watch it boot live, verify Telegram + WebUI, hand over.

## Verification checklist (do this on the call)

- [ ] Buyer's bot replies on Telegram within 30s of a message
- [ ] WebUI loads at `http://hermes.<tailnet>.ts.net:8787` (find exact name in Tailscale app)
- [ ] `curl http://localhost:8642/health` → `{"status":"ok"}`
- [ ] WebUI shows gateway chats in the sidebar (settings: *show previous messaging sessions*)

## Architecture

```
Buyer's phone ── Telegram (public internet)
      │
Buyer's phone ── Tailscale app ── tailnet ── VPS
                                            │
                       ┌────────────────────┴───────────────┐
                       │ hermes (agent, gateway, port 8642) │
                       │ hermes-webui (port 8787, tailnet   │
                       │   ONLY — no public ports)          │
                       │ tailscale sidecar (NET_ADMIN)      │
                       └────────────────────────────────────┘
```

No open firewall ports. No exposure. WebUI reachable only on the tailnet.

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| "Failed to initialize tailscale" | `TS_AUTHKEY` wrong/expired → regenerate (Reusable, not one-shot) |
| Bot doesn't reply | `docker logs hermes` — bad `BOT_TOKEN` or `TELEGRAM_USER_ID` |
| WebUI loads but no chats | Settings → enable *show previous messaging sessions* |
| WebUI permission crash | Check `docker logs hermes-webui` — `WANTED_UID/GID` must match host user (1000 default) |
| Re-run after failed boot | Delete server, recreate with the same script (idempotent) |

## Upgrades

```bash
cd /opt/hermes-stack && docker compose pull && docker compose up -d
```
Data persists in the `hermes-data` volume across upgrades.