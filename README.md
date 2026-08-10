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

## How It Works

```
You (Telegram) ←→ Hermes Agent + OpenCode API
                         ↓
                  Markdown logs (private, on your machine)
```

1. **[Hermes Agent](https://github.com/nousresearch/hermes-agent)** runs on your computer or a cheap VPS ($5/mo)
2. It connects to **Telegram** so you interact with it like a friend
3. It uses **OpenCode API** (~$10/mo) to understand your messages and respond intelligently
4. Everything is stored in **plain markdown files** — no vendor lock-in, fully private

---

## What You Need

| Requirement | Cost |
|------------|------|
| A computer (or $5/mo VPS) | $0–5/mo |
| OpenCode API key | ~$10/mo |
| Telegram account | Free |
| Basic comfort with copying commands | Free |

**Total: ~$10–15/month.** No subscriptions. No hidden fees. The software is completely free and open-source.

---

## Quick Start (15 Minutes)

### Step 1: Install Hermes Agent

```bash
# Install via pip
pip install hermes-agent

# Or via Docker (recommended for stability)
docker pull ghcr.io/nousresearch/hermes-agent:latest
```

### Step 2: Get Your API Key

1. Sign up at [OpenCode](https://opencode.ai)
2. Go to API Keys and create a new key
3. Fund with $10 (this will last you ~1 month)

### Step 3: Configure

```bash
# Clone this repo
git clone https://github.com/kevinyosef/hermes-configs.git
cd hermes-configs

# Copy the example config
cp config/config.example.yaml config/config.yaml

# Open config.yaml and paste your OpenCode API key
nano config/config.yaml
```

### Step 4: Set Up Your Telegram Bot

1. Message [@BotFather](https://t.me/BotFather) on Telegram
2. Send `/newbot` and follow the prompts
3. Copy the bot token you receive
4. Add it to your `config.yaml`

### Step 5: Start MindCheck

```bash
hermes agent start --config config/config.yaml
```

Send `/checkin` to your bot on Telegram to test. You should get a reply within seconds.

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
- **Efficient cron design** — MindCheck only calls the API during scheduled check-ins (3x/day), not every minute. Your $10 lasts the full month.
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

**Q: Can I run this without a VPS?**
Yes — run it on your personal computer. It only needs to be on during check-in times (morning, evening, bedtime). Or keep it running 24/7 for full coverage.

**Q: What if I don't know how to use a terminal?**
The setup steps are copy-paste. If you get stuck, DM me (see below).

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
