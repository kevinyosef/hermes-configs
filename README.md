# Hermes Agent Configs for ADHD & Bipolar

**By [Kevin Yosef](https://github.com/kevinyosef) — built from lived experience with Bipolar disorder & ADHD.**

Standard productivity tools (Todoist, Notion, reminders) fail neurodivergent brains because they wait for *you* to initiate. When you're in a depressive slump, overwhelmed, or burnt out, you don't open the app. Days turn into weeks.

This repo gives you an AI agent that reaches out to **you** via Telegram — a platform you already use. It checks in, spots patterns, and warns you before you crash. Built with [Hermes Agent](https://github.com/nousresearch/hermes-agent) — free, open-source, industry standard.

---

## What's Included

### ✅ Free Workflows (in this repo)

| Workflow | What happens |
|----------|-------------|
| **🌅 Morning Anchor** | 7am check-in. "What's one thing today?" Sets the day's tone in 30 seconds. |
| **📊 Daily Check-in** | Evening 3-question prompt. Mood, energy, wins. Voice notes or one-word texts work. |
| **🌙 Evening Wind-Down** | 9:30pm nudge. Protects your sleep — the single most important factor for mood stability. |

### 🔒 Premium Workflows (available with setup)

| Workflow | What it does |
|----------|-------------|
| **⚠️ Burnout Early Warning** | Analyzes 7 days of your data. Detects pre-crash trajectories and alerts you before you lose weeks. |
| **🧩 Task Unstucker** | Frozen on a task? Breaks it into 15-minute micro-steps so step 1 takes zero willpower. |
| **💼 Job Hunt Assistant** | Searches for roles, customizes resumes, gives you copy-paste-ready applications. |

> [See service packages below](#-done-for-you-setup-services) to get everything installed and customized.

---

## How It Works — The Big Picture

```
┌──────────────────────────────────────────────────────┐
│                   YOUR PHONE                         │
│  Telegram app ←── you chat with the agent here       │
└──────────────────┬───────────────────────────────────┘
                   │ internet (Telegram servers)
                   ▼
┌──────────────────────────────────────────────────────┐
│              YOUR SERVER (VPS or home PC)             │
│                                                      │
│  Hermes Gateway ←── always-on daemon (not tmux!)     │
│       │                                              │
│       ├── connects to Telegram 24/7                  │
│       ├── runs check-in workflows on schedule         │
│       ├── sends replies back to your phone           │
│       └── saves everything to markdown files          │
│                                                      │
│  OpenCode API  ←── the intelligence (~$10/mo)        │
│  Tailscale      ←── secure remote access (free)       │
└──────────────────────────────────────────────────────┘
```

The agent runs on a server. You talk to it from your phone via Telegram — like texting a friend. You only SSH into the server during initial setup.

---

## Important: We Use the Official Installer — NOT pip

Many Linux guides tell you to `pip install`. **That path is painful** — Python version conflicts, virtual environments, PEP 668 errors. Hermes has an official installer that handles everything automatically.

The installer downloads and manages its own Python, Node.js, and all dependencies. You just need `git`, `curl`, and `xz-utils`.

```bash
# The only prerequisites (Ubuntu/Debian):
sudo apt update && sudo apt install -y git curl xz-utils
```

---

## Choose Your Path

Pick the row that matches your setup — jump directly:

| Your setup | Go to |
|-----------|------|
| 🐧 Linux or 🍎 Mac (laptop/desktop) | [Path 1: Linux / Mac](#path-1-linux--mac-local-install) |
| 🪟 Windows PC | [Path 2: Windows](#path-2-windows-local-install) |
| ☁️ VPS server (runs 24/7, ~$5/mo) | [Path 3: VPS Server](#path-3-vps-server-runs-247) |
| Not technical / want it done for you | [Setup Services](#-done-for-you-setup-services) |

---

## Path 1: Linux / Mac (Local Install)

**Best if:** You have a laptop/desktop that stays on most of the day.
**Cost:** ~$10/mo (OpenCode API only)

### Step A1: Install Hermes (Official Installer)

Open your terminal and run ONE command:

```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
```

What happens: the installer downloads Hermes, sets up Python/Node.js for you, and puts `hermes` on your PATH. This takes 2-3 minutes.

After it finishes, reload your shell:

```bash
source ~/.bashrc   # or: source ~/.zshrc
```

Verify it worked:

```bash
hermes --version
```

> **🆘 Pitfall fix:** If `hermes` says "command not found", close and reopen your terminal. Still not working? Run `ls ~/.local/bin/hermes` — if it exists, add `export PATH="$HOME/.local/bin:$PATH"` to your `~/.bashrc`.

### Step A2: Configure Provider & Model

```bash
hermes model
```

This walks you through choosing a provider interactively. For the cheapest option that works great:

1. Select **OpenCode** (or "Custom provider")
2. When asked for API key, paste your OpenCode key
3. Choose model: `deepseek-v4-flash-free` (free tier) or `deepseek-v4-pro` (faster, ~$10/mo)

> **🆘 Pitfall fix:** If you don't have an OpenCode key yet, go to [opencode.ai](https://opencode.ai) → sign up → API Keys → Create. Add $10 credit — lasts about a month.

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
5. BotFather gives you a token like `7123456789:AAHdqTcvCH1sGWQ...` — **save this!**

### Step A5: Find Your Telegram User ID

Search **@userinfobot** on Telegram → send any message → it replies with your numeric ID. Save this too.

### Step A6: Start the Gateway (The Always-On Daemon)

```bash
hermes gateway setup
```

This walks you through connecting Telegram. When prompted:
- **Platform:** Telegram
- **Bot token:** Paste the token from Step A4
- **Allowed users:** Your numeric ID from Step A5

Then start the gateway:

```bash
hermes gateway start
```

The gateway runs in the background as a daemon. Open Telegram, send any message to your bot — it replies within seconds.

> **🆘 Pitfall fix:** If the bot doesn't respond, check `hermes gateway status`. If it says "stopped", check logs: `hermes gateway logs --tail 20`. Common issue: wrong bot token (copy-paste error) or API key not set.

**⚠️ Your computer must be ON for check-ins to fire.** For 24/7 coverage, use [Path 3: VPS Server](#path-3-vps-server-runs-247).

---

## Path 2: Windows (Local Install)

**Best if:** You're on Windows and your PC stays on most of the day.

### Step WA1: Install Hermes (Official Windows Installer)

Open **PowerShell** (right-click Start → Windows PowerShell) and run:

```powershell
irm https://hermes-agent.nousresearch.com/install.ps1 | iex
```

This downloads and installs everything automatically. After it finishes, close and reopen PowerShell.

> **🆘 Pitfall fix:** If PowerShell blocks the script with an execution policy error, run this first: `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned` — then re-run the install command.

Verify it worked:

```powershell
hermes --version
```

### Step WA2–WA5: Same as Path 1

From here, the steps are identical to Path 1 (Linux/Mac):
- **WA2:** `hermes model` to configure OpenCode
- **WA3:** `git clone https://github.com/kevinyosef/hermes-configs.git`
- **WA4:** Create Telegram bot via @BotFather
- **WA5:** `hermes gateway setup` → `hermes gateway start`

All `hermes` commands work the same on Windows. The gateway runs as a background process.

> **🆘 Pitfall fix:** If `git` is not found, install [Git for Windows](https://git-scm.com/download/win). If `hermes` is not found after install, restart PowerShell or your PC.

---

## Path 3: VPS Server (Runs 24/7)

**Best if:** You want the agent always running. $5/mo extra but you never miss a check-in.
**Cost:** ~$15/mo total ($5 VPS + $10 OpenCode API)

### Step B1: Get a VPS

We recommend **Hetzner** — $5/mo, reliable, beginner-friendly control panel.

1. Go to [hetzner.com/cloud](https://www.hetzner.com/cloud) → create account
2. Click **Create Server** → choose:
   - **Location:** Nuremberg or Helsinki
   - **Image:** Ubuntu 24.04
   - **Type:** CX22 (1 vCPU, 2 GB RAM) — $4.59/mo
3. **SSH Key:** We'll set this up next

### Step B2: Set Up SSH Access

**On your local computer:**

```bash
# Generate SSH key (Enter for all prompts)
ssh-keygen -t ed25519

# Display your public key:
cat ~/.ssh/id_ed25519.pub
```

Copy the output (starts with `ssh-ed25519...`). Back in Hetzner, paste it into the **SSH Key** field during server creation. If server already exists: go to server → **SSH Keys** → **Add**.

### Step B3: Connect & Install Hermes

Hetzner shows your server IP (like `49.12.xxx.xxx`). Connect:

```bash
ssh root@YOUR_SERVER_IP
# Type 'yes' for fingerprint prompt
```

Now install Hermes (official installer — no pip hell):

```bash
# Prerequisites
apt update && apt install -y git curl xz-utils

# Official installer (one command!)
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash

# Reload shell
source ~/.bashrc

# Verify
hermes --version
```

> **🆘 Pitfall fix:** If the installer fails with "xz not found": `apt install -y xz-utils` and re-run. If it complains about permissions: make sure you're logged in as `root` (the default for new Hetzner servers). If the installer hangs: press Ctrl+C and re-run — it's idempotent (safe to retry).

### Step B4: Configure Provider

```bash
hermes model
```

Choose **OpenCode** → paste your API key → select `deepseek-v4-flash-free` (free tier).

> **🆘 Pitfall fix:** If `hermes model` errors saying "config not found", run `hermes setup` first to initialize the config file, then try `hermes model` again.

### Step B5: Set Up Telegram Gateway (The Always-On Daemon)

```bash
hermes gateway setup
```

Follow the prompts:
- **Platform:** Telegram
- **Bot token:** From @BotFather (see Path 1 Step A4)
- **Allowed users:** Your Telegram numeric ID (from @userinfobot)

Then start it as a daemon:

```bash
hermes gateway start --daemonize
```

The `--daemonize` flag makes it run in the background and survive you disconnecting from SSH. It will auto-restart if it crashes.

> **🆘 Pitfall fix:** If `hermes gateway start` exits immediately without error, check `hermes gateway logs` — it might have started but failed to connect due to a bad token. If the gateway won't start at all: `hermes gateway setup` again and verify your bot token character by character.

### Step B6: Verify It Works

Open Telegram on your phone. Send any message to your bot. It should reply within seconds. Send `/checkin` to test the check-in workflow.

To check gateway status anytime:

```bash
hermes gateway status    # Shows if running
hermes gateway logs      # Shows recent output
```

> **🆘 Pitfall fix:** Bot not replying? Run through this checklist:
> 1. `hermes gateway status` — is it "running"?
> 2. `hermes gateway logs --tail 20` — any error messages?
> 3. Did you message the RIGHT bot? (check the username)
> 4. Is your API key valid? Run `hermes model` to verify
> 5. Did you add your user ID to allowed users? The bot ignores messages from unknown IDs

### Step B7: Set Up Tailscale (Free — Secure Remote Access)

Tailscale creates a private network between your devices. You can SSH into your server and access the Hermes web dashboard without exposing ports to the internet.

**On your server:**

```bash
curl -fsSL https://tailscale.com/install.sh | sh
tailscale up
```

It prints a URL — open it in your browser to authenticate. Done.

**On your phone:** Install [Tailscale](https://tailscale.com/download) (iOS/Android, free) → sign in with same account → your server appears in the device list.

**What Tailscale gives you:**
- SSH from your phone/laptop: `ssh root@[server-tailscale-ip]`
- Web dashboard: open `http://[server-tailscale-ip]:8080` in your browser
- No exposed ports. No passwords. Pure WireGuard.

### How It All Connects

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

Day-to-day: you only use Telegram. The gateway daemon handles everything automatically.

---

## Cost Breakdown — No Surprises

| Item | Monthly Cost | Notes |
|------|-------------|-------|
| OpenCode API (zen models) | ~$8–10 | Generous free tier covers most usage |
| VPS (optional, if not running locally) | $5 | Hetzner, DigitalOcean, or similar |
| Telegram Bot API | $0 | Free, unlimited messages |
| Hermes Agent | $0 | Open source, MIT licensed |
| Workflow prompts | $0 | Free, included in this repo |
| **TOTAL** | **$10–15/mo** | |

> **Note:** You do NOT need to manually edit config files. The commands `hermes model` and `hermes gateway setup` handle all configuration interactively. The `config/config.example.yaml` file in this repo is a reference — it shows what settings are available, not what you must edit.

### How This Setup Saves You Money

- **Replaces $200+/mo in subscriptions** — Notion AI ($10), Motion ($19), Sunsama ($20), Todoist Pro ($5), ADHD coaching ($150+/session)
- **Efficient cron design** — The agent only calls the API during scheduled check-ins (3x/day), not every minute. Your $10 lasts the full month.
- **No vendor lock-in** — Your data is plain markdown. Leave anytime. Export anywhere.
- **One API for everything** — You don't need ChatGPT Plus ($20) + Claude Pro ($20) + separate tools. MindCheck uses one affordable API.

---

## The Workflows

| File | Status | What it does |
|------|--------|-------------|
| `workflows/morning-anchor.md` | ✅ Free | 7am daily check-in prompt |
| `workflows/daily-checkin.md` | ✅ Free | Evening 3-question mood/energy/wins log |
| `workflows/evening-winddown.md` | ✅ Free | 9:30pm bedtime nudge |
| `workflows/burnout-detection.md` | 🔒 Premium | Weekly pattern analysis and crash warnings |
| `workflows/task-unstucker.md` | 🔒 Premium | Breaks paralyzed tasks into micro-steps |
| `workflows/job-hunt.md` | 🔒 Premium | Resume customization and application prep |

Free files contain the exact system prompts — copy, paste, customize.
Premium files describe what each workflow does and how to get it.

---

## FAQ

**Q: I don't know anything about servers or terminals. Can I still do this?**
The Path 1, Path 2, and Path 3 instructions above are written for complete beginners. Every command is explained. You just copy-paste. If you get stuck at any step, DM me.

**Q: Can I run this without a VPS?**
Yes — Path 1 or Path 2 runs on your personal computer. It only needs to be ON during check-in times (morning, evening, bedtime). Path 3 gives you 24/7 coverage for $5/mo.

**Q: How do I check if the agent is still running?**
On your phone, send `/checkin` to your bot. If it replies, the gateway is alive. No need to SSH in. To check server-side: `hermes gateway status` and `hermes gateway logs --tail 20`.

**Q: How do I access the Hermes web dashboard?**
After setting up Tailscale, open your browser to `http://[your-server-tailscale-ip]:8080`. You'll see a dashboard showing gateway status, active workflows, and logs.

**Q: What if the server restarts?**
The gateway started with `--daemonize` auto-restarts. For reboots, create a simple systemd service — run `hermes gateway setup` and it will offer to create one for you automatically.

**Q: What if `hermes model` or `hermes gateway` is "not found" after install?**
Run `source ~/.bashrc` or close and reopen your terminal. The installer adds `hermes` to your PATH but the current shell doesn't know about it yet.

**Q: Is my data private?**
Yes. Everything is stored locally on your machine. Nothing goes to the cloud except your Telegram messages (which are encrypted) and API calls to OpenCode.

**Q: Can I customize the check-in questions?**
Absolutely. Every workflow is a simple markdown file. Edit the questions to match your life.

**Q: What if I'm not technical at all?**
See the setup services below.

---

---

## 🚀 Done-For-You Setup Services

> **You don't touch the terminal. I set everything up for you.**

---

<div align="center">

|  |  |  |
|:--:|:--:|:--:|
| ### 💼 Starter Pack | ### ⚡ Done-For-You | ### 🎯 Premium |
| **$45** | **$150–250** | **$400–600** |
| one-time | one-time | one-time |
| | | |
| ✅ Full repo access | ✅ Everything in Starter | ✅ Everything in Done-For-You |
| ✅ 5 workflow templates | ✅ 45-min live setup call | ✅ 5 custom workflows |
| ✅ 15-min video walkthrough | ✅ Full installation on your machine/VPS | ✅ Monthly check-in calls (3 months) |
| ✅ 1 week email support | ✅ Telegram bot connected & tested | ✅ Priority support |
| | ✅ Workflows customized to YOUR routine | ✅ Custom integrations (Notion, Calendar, etc.) |
| | ✅ 2 weeks follow-up support | |
| | ✅ Setup reference guide | |
| | | |
| **For the time-poor dev** | **Most popular — just works** | **For professionals who want a partner** |
| | | |
| [DM on Reddit](#) | [DM on Reddit](#) | [DM on Reddit](#) |

</div>

---

<p align="center">
<b>📩 Ready to get started?</b><br>
DM me on Reddit or open an issue on this repo<br>
<sub>I usually respond within a few hours.</sub>
</p>

---

## License

MIT — free to use, modify, and share.

---

*Built by [Kevin Yosef](https://github.com/kevinyosef). If this helps one person avoid the crashes I went through, it was worth it.*
