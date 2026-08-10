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

Here's what you're building. It sounds complex. It's not — we'll walk through each piece.

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
│  Hermes Agent  ←── the brain                         │
│       │                                              │
│       ├── reads your Telegram messages               │
│       ├── runs check-in workflows on schedule         │
│       ├── sends replies back to Telegram             │
│       └── saves everything to markdown files          │
│                                                      │
│  OpenCode API  ←── the intelligence (~$10/mo)        │
│  Tailscale      ←── secure remote access (free)       │
└──────────────────────────────────────────────────────┘
```

**The key insight:** The agent runs on a server, but you talk to it from your phone via Telegram — just like texting a friend. You never need to SSH into the server to use it day-to-day. You only touch the server during initial setup.

---

## Path A: Install on Your Own Computer (Simplest)

**Best if:** You have a laptop/desktop that stays on most of the day, or you only need check-ins at specific times (morning/evening).

**Cost:** $10/mo (OpenCode API only)

### Step A1: Install Hermes Agent

Open your terminal (Command Prompt on Windows, Terminal on Mac/Linux) and copy-paste:

```bash
# Install Hermes Agent
pip install hermes-agent
```

### Step A2: Get Your API Key

1. Go to [opencode.ai](https://opencode.ai) and sign up (free)
2. Navigate to **API Keys** in your dashboard
3. Click **Create Key** and copy it
4. Add $10 credit — this will last about a month with normal use

### Step A3: Clone This Repo & Configure

```bash
git clone https://github.com/kevinyosef/hermes-configs.git
cd hermes-configs
cp config/config.example.yaml config/config.yaml
```

Now edit `config/config.yaml`. Replace these two lines:

```yaml
opencode_api_key: "sk-..."      # ← paste your OpenCode key here
bot_token: "123456:ABC-DEF..."  # ← you'll get this next
```

### Step A4: Create Your Telegram Bot

1. Open Telegram on your phone
2. Search for **[@BotFather](https://t.me/BotFather)** — this is Telegram's official bot-creation tool
3. Send the message: `/newbot`
4. BotFather will ask for a name. Type something like `My ADHD Checkin Bot`
5. Then a username ending in `bot`, like `my_checkin_bot`
6. BotFather replies with a token — looks like `7123456789:AAHdqTcvCH1sGWQ...`
7. Copy that token into your `config.yaml` as `bot_token`

### Step A5: Find Your Telegram User ID

The bot needs to know it should only talk to YOU:

1. On Telegram, search for **[@userinfobot](https://t.me/userinfobot)**
2. Send it any message — it replies with your numeric ID
3. Copy that number into `config.yaml` as `allowed_user_id`

### Step A6: Start the Agent

```bash
hermes agent start --config config/config.yaml
```

You'll see logs showing the agent starting. Once it says "ready" or "listening," open Telegram and send `/checkin` to your bot. You should get a reply within seconds.

**⚠️ Important:** Your computer needs to be ON for scheduled check-ins to fire. If you shut down at night, the evening check-in won't send. For 24/7 coverage, use Path B below.

---

## Path B: Install on a VPS (Runs 24/7, Access From Phone)

**Best if:** You want the agent always running, or your computer isn't always on. This costs $5/mo extra but means you never miss a check-in.

**Cost:** $15/mo total ($5 VPS + $10 OpenCode API)

### Step B1: Get a VPS (5 Minutes)

We recommend **Hetzner** — $5/mo, reliable, and the control panel is beginner-friendly.

1. Go to [hetzner.com/cloud](https://www.hetzner.com/cloud) and create an account
2. Click **Create Server**
3. Choose these options:
   - **Location:** Nuremberg or Helsinki (closest to Africa/Europe)
   - **Image:** Ubuntu 24.04
   - **Type:** CX22 (1 vCPU, 2 GB RAM) — $4.59/mo
   - **SSH Key:** You'll set this up next
4. Click **Create & Buy Now**

### Step B2: Set Up SSH Access

SSH is how you connect to your server from your computer. It's like opening a secure terminal window into the remote machine.

**On your local computer (not the VPS):**

```bash
# Generate an SSH key (press Enter for all prompts — defaults are fine)
ssh-keygen -t ed25519

# Display your public key (you'll paste this into Hetzner)
cat ~/.ssh/id_ed25519.pub
```

Copy the entire output (starts with `ssh-ed25519...`).

Back on Hetzner, during server creation, paste this into the **SSH Key** field. If you already created the server, go to your server → **SSH Keys** → **Add**.

### Step B3: Connect to Your Server

Hetzner will show your server's IP address (like `49.12.xxx.xxx`). From your computer:

```bash
ssh root@YOUR_SERVER_IP
```

Type `yes` when asked about fingerprint. You're now inside your server!

### Step B4: Install Hermes on the Server

Inside your SSH session, copy-paste these commands one at a time:

```bash
# Update the system
apt update && apt upgrade -y

# Install prerequisites
apt install -y python3 python3-pip git curl

# Install Hermes Agent
pip install hermes-agent --break-system-packages

# Clone this repo
git clone https://github.com/kevinyosef/hermes-configs.git
cd hermes-configs
cp config/config.example.yaml config/config.yaml
```

### Step B5: Configure (Same as Path A Steps A2-A5)

Edit `config/config.yaml` with your OpenCode key, Telegram bot token, and Telegram user ID:

```bash
nano config/config.yaml
```

In nano: use arrow keys to navigate, paste your values, then `Ctrl+X` → `Y` → `Enter` to save.

### Step B6: Start Hermes in the Background

```bash
# Install tmux so the agent keeps running after you disconnect
apt install -y tmux

# Start a persistent session
tmux new -s hermes

# Inside tmux, start the agent
hermes agent start --config config/config.yaml
```

To disconnect without stopping: press `Ctrl+B`, then `D`. To reconnect later: `tmux attach -t hermes`.

Send `/checkin` to your bot on Telegram to test!

### Step B7: Set Up Tailscale (Free — Access Your Server Securely)

Tailscale creates a private network between your devices. You can access your server's web dashboard from your phone or laptop without exposing anything to the internet.

**On your server (inside SSH):**

```bash
curl -fsSL https://tailscale.com/install.sh | sh
tailscale up
```

It prints a URL — open it in your browser to authenticate. Your server is now on your private Tailscale network.

**On your phone:**
1. Install the **Tailscale** app (iOS/Android — it's free)
2. Sign in with the same account
3. Your phone and server are now connected. You'll see the server listed in the app.

**On your laptop (optional):**
Download Tailscale from [tailscale.com/download](https://tailscale.com/download) — same account.

**What Tailscale gives you:**
- Access the Hermes web dashboard: open your browser and go to `http://[tailscale-ip]:8080` (get the IP from `tailscale status` on the server)
- SSH without exposing port 22 to the internet: `ssh root@[tailscale-ip]`
- Your bot communicates via Telegram (not Tailscale) — Tailscale is for YOU to manage the agent

### How It All Connects to Your Phone

```
Your Phone                    Telegram Servers              Your VPS
┌──────────────┐              ┌──────────────┐           ┌─────────────────┐
│ Telegram App │────msg──────▶│   Telegram    │───API────▶│  Hermes Agent   │
│              │◀───reply─────│   Servers     │◀──API─────│  (tmux session)  │
└──────────────┘              └──────────────┘           │                 │
       │                                                  │  OpenCode API   │
       │  Tailscale (for admin only)                      │  Markdown logs  │
       └──────────────────────────────────────────────────│  Tailscale      │
                                                          └─────────────────┘
```

**Day-to-day use:** You only open Telegram on your phone. That's it. No SSH. No dashboard. Just text your bot like a friend.

**When you need to check on the agent:** Open Tailscale app → your server is listed → SSH from your phone or laptop securely.

---

## Cost Breakdown — No Surprises

| Item | Monthly Cost | Notes |
|------|-------------|-------|
| OpenCode API (zen models) | ~$8–10 | Generous free tier covers most usage |
| VPS (optional, if not running locally) | $5 | Hetzner, DigitalOcean, or similar |
| Telegram Bot API | $0 | Free, unlimited messages |
| Hermes Agent | $0 | Open source, MIT licensed |
| MindCheck workflows | $0 | Free, included in this repo |
| **TOTAL** | **$10–15/mo** | |

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
The Path A and Path B instructions above are written for complete beginners. Every command is explained. You just copy-paste. If you get stuck at any step, DM me.

**Q: Can I run this without a VPS?**
Yes — Path A runs on your personal computer. It only needs to be ON during check-in times (morning, evening, bedtime). Path B gives you 24/7 coverage for $5/mo.

**Q: How do I check if the agent is still running?**
On your phone, send `/checkin` to your bot. If it replies, the agent is alive. No need to SSH in. If no reply, use Tailscale to SSH and run `tmux attach -t hermes` to see what happened.

**Q: How do I access the Hermes web dashboard?**
After setting up Tailscale, open your browser and go to `http://[your-server-tailscale-ip]:8080`. You'll see a dashboard showing active workflows, logs, and config.

**Q: What if the server restarts?**
Set up the auto-restart script in `scripts/auto-start.sh` (included in this repo). It ensures Hermes starts automatically if the server reboots.

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
