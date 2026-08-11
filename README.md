# An AI Agent That Checks on You — Built for ADHD & Bipolar Brains

**By Kevin Yosef — built from lived experience with Bipolar disorder & ADHD.**

Standard productivity tools (Todoist, Notion, reminders) fail neurodivergent brains because they wait for *you* to initiate. When you're in a depressive slump, overwhelmed, or burnt out, you don't open the app. Days turn into weeks.

This repo gives you an AI agent that reaches out to **you** via Telegram — a platform you already use. It checks in, spots patterns, and warns you before you crash. Built with [Hermes Agent](https://github.com/nousresearch/hermes-agent) — free, open-source, industry standard.

> 📩 **Want this running this week without touching a terminal?** [Jump to setup services →](#-done-for-you-setup-services)

⏱️ **Time to a working bot: ~15 minutes** (copy-paste DIY) or **45 minutes** (done-for-you call).

---

## 🎁 FREE: Three Ready-to-Use Workflows

Steal these. They're the exact prompts I use every day.

| Workflow | What happens |
|----------|-------------|
| **🌅 Morning Anchor** | 7am check-in. "What's one thing today?" Sets the day's tone in 30 seconds. |
| **📊 Daily Check-in** | Evening 3-question log. Mood, energy, wins. Voice notes or one-word texts work. |
| **🌙 Evening Wind-Down** | 9:30pm nudge. Protects your sleep — the single most important factor for mood stability. |

[Get the full prompts →](WORKFLOWS.md#free-workflows)

---

## My Before / After

**Before:** I lost 3-week blocks to crashes. Forgot to eat. Job applications burned me out in 2 days. Scrolling was my coping mechanism — 12 hours a day.

**After:** The agent catches the downswing on day 3, not week 3. It checks in at 7am and 9:30pm whether I feel like it or not. It breaks frozen tasks into steps so small they're laughably easy. I haven't lost a week since.

I built this because I had to. Then I realized half of r/ADHD_Programmers needs the same thing — so I'm sharing it.

---

## What's Included

### ✅ Free (in this repo)
- **3 ready-to-use workflows** — exact prompts, copy-paste-customize

### 🔒 Premium (with setup)
| Workflow | What it does |
|----------|-------------|
| **⚠️ Burnout Early Warning** | Analyzes 7 days of your data. Detects pre-crash trajectories and alerts you before you lose weeks. |
| **🧩 Task Unstucker** | Frozen on a task? Breaks it into 15-minute micro-steps so step 1 takes zero willpower. |
| **💼 Job Hunt Assistant** | Searches for roles, customizes resumes, gives you copy-paste-ready applications. |

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
│  Hermes Gateway ←── always-on daemon                  │
│       ├── connects to Telegram 24/7                  │
│       ├── runs check-in workflows on schedule         │
│       ├── sends replies back to your phone           │
│       └── saves everything to markdown files          │
│  Model provider ←── $0 free, or ~$10/mo              │
└──────────────────────────────────────────────────────┘
```

The agent runs on a server. You talk to it from your phone via Telegram — like texting a friend. You only touch the technical stuff during setup.

**🚀 Quick start:** [SETUP.md — 15-minute guided walkthrough](SETUP.md) (works with your phone alone).
**🔧 Detailed guide:** [INSTALL.md — all platforms & pitfalls](INSTALL.md).

---

## Cost Breakdown — No Surprises

| Item | Monthly Cost | Notes |
|------|-------------|-------|
| Model provider | $0–10 | **Free:** Nous Portal (Quick Setup). **~$10:** OpenCode for pay-per-use |
| VPS (optional, 24/7 coverage) | $5 | Hetzner, DigitalOcean, or similar |
| Telegram Bot API | $0 | Free, unlimited messages |
| Hermes Agent | $0 | Open source, MIT licensed |
| Workflow prompts | $0 | Free, included in this repo |
| **TOTAL** | **$0–15/mo** | Start free, upgrade if you want |

### This Setup Pays for Itself

- **Replaces $200+/mo in subscriptions** — Notion AI ($10) + Motion ($19) + Sunsama ($20) + Todoist Pro ($5) + coaching ($150+/session)
- **Efficient cron design** — the agent only calls the API during check-ins (3x/day), not every minute. Even the paid tier stays under $10/mo.
- **No vendor lock-in** — your data is plain markdown. Leave anytime. Export anywhere.
- **One API for everything** — no ChatGPT Plus ($20) + Claude Pro ($20) + scattered tools.

---

## FAQ

**Q: Is my data private?**
Yes. Everything is stored locally on your machine. Nothing goes to the cloud except your Telegram messages (which are encrypted) and API calls to your model provider.

**Q: I'm not technical at all. Can I still do this?**
Yes — that's exactly what the setup services below are for. You don't touch the terminal. I set everything up for you, test it, and hand you a working system.

**Q: Can I customize the check-in questions?**
Absolutely. Every workflow is a simple markdown file. Edit the questions to match your life.

**Q: Can I run this without a VPS?**
Yes — Path 1 (Linux/Mac) or Path 2 (Windows) runs on your personal computer. It only needs to be ON during check-in times. Path 3 gives you 24/7 coverage for $5/mo. [See the install guide →](INSTALL.md#choose-your-path)

**Q: How do I check if the agent is still running?**
On your phone, send `/checkin` to your bot. If it replies, it's alive. No need to SSH in.

**Q: What if the server restarts?**
The gateway (`--daemonize`) auto-restarts. For full reboots, `hermes gateway setup` offers to create a systemd service automatically.

**Q: What if I already have OpenAI/Claude API keys?**
Those work too. Pick your provider during `hermes model`.

---

## 🚀 Done-For-You Setup Services

> **You don't touch the terminal. I set everything up for you.**

<div align="center">

| | | |
|:--:|:--:|:--:|
| ### 💼 Starter Pack | ### ⚡ Done-For-You 🏆 | ### 🎯 Premium |
| **$60** | **$199** | **$400–600** |
| one-time | one-time | one-time |
| | | |
| ✅ Full repo access | ✅ Everything in Starter | ✅ Everything in Done-For-You |
| ✅ 5 workflow templates | ✅ 45-min live setup call | ✅ 5 custom workflows |
| ✅ **One-click deploy kit** — paste 1 file, live in 4 min | ✅ Full installation on your machine/VPS | ✅ Monthly check-in calls (3 months) |
| ✅ 15-min video walkthrough | ✅ Telegram bot connected & tested | ✅ Priority support |
| ✅ 1 week email support | ✅ Workflows customized to YOUR routine | ✅ Custom integrations (Notion, Calendar, etc.) |
| | ✅ 2 weeks follow-up support | ✅ 🧠 ND-specific tuning (executive function, RSD, focus patterns) |
| | ✅ Setup reference guide | ✅ 📈 Monthly pattern report — mood, energy, sleep trends |
| | ⏱️ 2–4 hrs of your time across the call | ✅ 🚨 Crisis escalation setup (trusted contact alert) |
| | | ✅ 🧰 Custom tools & automations (task unstuck, habits, meds) |
| | | ✅ 🎓 1:1 onboarding + usage coaching sessions |
| **Zero technical friction — no terminal, no SSH** | **Most popular — just works** | **For professionals who want a partner** |
| | | |
| [Get Starter →](#get-in-touch) | [Schedule Done-For-You →](https://zcal.co/i/FwKyI-4B) | [Schedule Premium →](https://zcal.co/i/FwKyI-4B) |

</div>

> **🛡️ Risk reversal:** Not happy after your setup call? Full refund, no questions asked. I'd rather you have a working system than keep your money.

> 💡 **One-time cost caveats:** The Starter Pack's one-click deploy kit needs a VPS (~$5/mo, ~$60/yr) — Hetzner or DigitalOcean. The Done-For-You setup takes **2–4 hours of your time** across the call (account creation, questions, personalization). You're paying for my expertise AND your time savings — the work is still yours to configure with me.

---

## Get In Touch

Prefer to build it yourself? Here's the order of operations:

1. **Install first** → [INSTALL.md](INSTALL.md) — every platform, every pitfall, full terminal walkthrough
2. **Then set up** → [SETUP.md](SETUP.md) — 3 parts, copy-paste, works from your phone

Want help, or want to join the community? Two ways:

### 📧 Email me

Send a message and I'll reply within a few hours:

<form action="https://formspree.io/f/your-form-id" method="POST">
  <input type="email" name="email" placeholder="Your email" required><br><br>
  <textarea name="message" placeholder="What do you need help with?" rows="4" required></textarea><br><br>
  <button type="submit">Send</button>
</form>

*(Form doesn't render on mobile GitHub? Email me directly: kevinyosef@proton.me)*

### 💬 Join the Discord

Direct access to me and fellow neurodivergents using AI agents to keep their lives together. Get help, share what works, swap workflows:

**[Join the community →](https://discord.gg/your-invite)**

Questions? [Open an issue](https://github.com/kevinyosef/hermes-configs/issues/new) or [DM me on Reddit](https://reddit.com/message/compose?to=kevinyosef).