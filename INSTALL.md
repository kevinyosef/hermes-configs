# Installation Guide

Full setup instructions for all platforms. **Do these steps after reading the [README](README.md) and deciding this is for you.**

---

## Before You Start

### Get Your OpenCode API Key (Do This First)

An **API key** is like a password that lets Hermes talk to the AI brain (the language model). Instead of you typing into ChatGPT's website, Hermes sends your messages through this key and gets responses back. The company charges per message — about $10/month for normal use. Think of it like prepaid phone credit.

**Step-by-step:**

1. Go to [opencode.ai](https://opencode.ai) → click **Sign Up** (top right). Google, GitHub, or email all work.
2. Open the dashboard → look for **API Keys** in the left sidebar.
3. Click **Create API Key** → name it "Hermes Agent" (the name doesn't matter).
4. **Copy the key immediately.** It shows once, like `sk-opencode-a1b2c3d4...`. Paste it somewhere safe. You cannot see it again after closing the window.
5. Click **Billing** → add $10 (prepaid, not a subscription). Lasts 3–5 weeks with normal check-in usage.

> **Already have OpenAI/Anthropic keys?** Those work too — pick your provider during `hermes model`.

### Important: We Use the Official Installer — NOT pip

Many guides tell you to `pip install`. **That path is painful** — Python version conflicts, virtual environments, PEP 668 errors. Hermes has an official installer that handles everything (Python, Node.js, all dependencies) for you.

Prerequisites on Linux (Ubuntu/Debian):

```bash
sudo apt update && sudo apt install -y git curl xz-utils
```

---

## Choose Your Path

| Your setup | Go to |
|-----------|------|
| 🐧 Linux / 🍎 Mac (laptop) | [Path 1: Linux/Mac](#path-1-linux--mac-local-install) |
| 🪟 Windows PC | [Path 2: Windows](#path-2-windows-local-install) |
| ☁️ VPS (runs 24/7, ~$5/mo) | [Path 3: VPS Server](#path-3-vps-server-runs-247) |

---

## Path 1: Linux / Mac (Local Install)

**Best if:** You have a laptop/desktop that stays on most of the day.
**Cost:** ~$10/mo (OpenCode API only). **Time:** ~15 min.

### Step A1: Install Hermes (Official Installer)

```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
```

The installer downloads Hermes, sets up Python/Node.js, and puts `hermes` on your PATH. Takes 2–3 minutes.

Reload your shell:

```bash
source ~/.bashrc   # or: source ~/.zshrc
```

Verify:

```bash
hermes --version
```

> **🆘 Fix:** "command not found" → close/reopen terminal. Still stuck? `ls ~/.local/bin/hermes` — if it exists, add `export PATH="$HOME/.local/bin:$PATH"` to `~/.bashrc`.

### Step A2: Configure Provider & Model

```bash
hermes model
```

Select **OpenCode** → paste your API key → choose model: `deepseek-v4-flash-free` (free tier, slower) or `deepseek-v4-pro` (faster, uses more credit).

### Step A3: Clone This Repo

```bash
git clone https://github.com/kevinyosef/hermes-configs.git
cd hermes-configs
```

### Step A4: Create Your Telegram Bot

1. Open Telegram → search **@BotFather**
2. Send: `/newbot`
3. Name it (e.g. "My ADHD Checkin Bot")
4. Username must end in `bot` (e.g. `my_adhd_bot`)
5. BotFather gives a token like `7123456789:AAHdqTcvCH1sGWQ...` — **save it!**

### Step A5: Find Your Telegram User ID

Search **@userinfobot** on Telegram → send any message → it replies with your numeric ID. Save this too.

### Step A6: Start the Gateway (The Always-On Daemon)

```bash
hermes gateway setup
```

Follow the prompts: Platform → Telegram → bot token → allowed users (your ID).
Then:

```bash
hermes gateway start
```

Open Telegram → send any message to your bot → it replies within seconds.

> **🆘 Fix:** Bot not responding? `hermes gateway status`, then `hermes gateway logs --tail 20`. Most common: wrong bot token or API key not set.

**⚠️ Your computer must be ON for check-ins to fire.** For 24/7, use [Path 3](#path-3-vps-server-runs-247).

---

## Path 2: Windows (Local Install)

**Best if:** You're on Windows and your PC stays on most of the day.

### Step WA1: Install Hermes (Official Windows Installer)

Open **PowerShell** (right-click Start → Windows PowerShell):

```powershell
irm https://hermes-agent.nousresearch.com/install.ps1 | iex
```

Close and reopen PowerShell after it finishes.

> **🆘 Fix:** If PowerShell blocks the script: `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned` → re-run the install.

Verify:

```powershell
hermes --version
```

### Step WA2–WA5: Same as Path 1

- **WA2:** `hermes model` to configure OpenCode
- **WA3:** `git clone https://github.com/kevinyosef/hermes-configs.git`
- **WA4:** Create Telegram bot via @BotFather
- **WA5:** `hermes gateway setup` → `hermes gateway start`

> **🆘 Fix:** `git` not found → install [Git for Windows](https://git-scm.com/download/win). `hermes` not found → restart PowerShell or your PC.

---

## Path 3: VPS Server (Runs 24/7)

**Best if:** You want the agent always running — you never miss a check-in.
**Cost:** ~$15/mo total ($5 VPS + $10 OpenCode API). **Time:** ~30 min.

### Step B1: Get a VPS

1. [hetzner.com/cloud](https://www.hetzner.com/cloud) → create account
2. **Create Server** → Location: Nuremberg/Helsinki · Image: Ubuntu 24.04 · Type: CX22 (1 vCPU, 2 GB RAM, $4.59/mo)
3. **SSH Key:** set up next

### Step B2: Set Up SSH

**On your local computer:**

```bash
ssh-keygen -t ed25519            # Enter for all prompts
cat ~/.ssh/id_ed25519.pub        # Copy output
```

Paste the key into Hetzner's **SSH Key** field (during creation, or Server → SSH Keys → Add).

### Step B3: Connect & Install Hermes

```bash
ssh root@YOUR_SERVER_IP          # type 'yes' for fingerprint
```

```bash
apt update && apt install -y git curl xz-utils
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
source ~/.bashrc
hermes --version
```

> **🆘 Fix:** "xz not found" → `apt install -y xz-utils` and re-run. Installer hangs → Ctrl+C and re-run (safe to retry).

### Step B4: Configure Provider

```bash
hermes model
```

OpenCode → paste API key → `deepseek-v4-flash-free`.

> **🆘 Fix:** "config not found" error → run `hermes setup` first, then `hermes model` again.

### Step B5: Set Up the Gateway (Daemon)

```bash
hermes gateway setup
```

Platform → Telegram → bot token → allowed users. Then:

```bash
hermes gateway start --daemonize
```

`--daemonize` runs it in the background, survives SSH disconnect, auto-restarts on crash.

### Step B6: Verify

Send any message to your bot on Telegram → replies within seconds. `/checkin` tests the workflow.

```bash
hermes gateway status    # Is it running?
hermes gateway logs      # Recent output
```

> **🆘 Bot not replying checklist:** 1) `hermes gateway status` — running? 2) `hermes gateway logs --tail 20` — errors? 3) Messaging the RIGHT bot? 4) API key valid? (`hermes model`) 5) User ID in allowed users? Unknown IDs are ignored.

### Step B7: Tailscale (Free — Secure Remote Access)

On the server:

```bash
curl -fsSL https://tailscale.com/install.sh | sh
tailscale up               # open the printed URL to authenticate
```

On your phone: install [Tailscale](https://tailscale.com/download) → same account → server appears in device list.

**What it gives you:**
- SSH from anywhere: `ssh root@[server-tailscale-ip]`
- Web dashboard: `http://[server-tailscale-ip]:8080`
- No exposed ports. No passwords. Pure WireGuard.

---

## How It All Connects

```
Your Phone                    Telegram Servers              Your VPS
┌──────────────┐              ┌──────────────┐           ┌─────────────────┐
│ Telegram App │────msg──────▶│   Telegram    │───API────▶│ Hermes Gateway   │
│              │◀───reply─────│   Servers     │◀──API─────│ (daemon, 24/7)  │
└──────────────┘              └──────────────┘           │                 │
       │                                                  │  OpenCode API   │
       │  Tailscale (admin only, secure)                  │  Markdown logs  │
       └──────────────────────────────────────────────────│  Tailscale      │
                                                          └─────────────────┘
```

Day-to-day: you only use Telegram. The gateway handles everything.