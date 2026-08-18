# An AI Agent That Checks on You — Built for ADHD & Bipolar Brains

**By Kevin Yosef — built from lived experience with Bipolar disorder & ADHD.**

The apps we use (Todoist, Notion, and even Reclaim and Motion) get often ignored on rough days, tasks keep accumulating and we leave them for a long time because the lists are daunting.

This is a free installation and setup guide for the free AI agent - [Hermes Agent](https://github.com/nousresearch/hermes-agent) and this repository gives you the configurations that I use to make it work for people like me - Bipolar, ADHD, Depression and even poeple with chronic fatigue.

The setup configures it to help people with Bipolar, Depression, ADHD and Chronic Fatigue and even burnout complete tasks.

Started working on it shortly after going to hospital for mania and it has helped a ton. I'm now already doing interviews :) and the agent helped look for the jobs and customize my resumes (Things that would have burnt me out in 3 days and would have ended up postponing or doing lazily). Been getting freelance clients as well :)

> Disclaimer: I am opposed to AI therapy and cannot thing of anything worse for you than consulting AI for any medical advice. This setup is to only help you keep your life in check - task initiation, task completion, addiction recovery, routine and habit adherance. You can change it at your own risk and also note, it is possible to acidentally get caried away in a chat regarding your health and I do not take accountability for that.

You can access it through any messaging app; Telegram, Whatsapp, Slack, Email, IMessage, etc and connect to your calendar, email, etc to get tasks done for you. Complete tasks from bed. You will mostly be reiewing and aproving agent task completion.

I plan to write tutorial later on as well. You can bookmark this and then come back when you need to learn sth :)

## Benefits
- IT checks in on you on a daily basis to know how you are doing, journal that and then if you need to, change the tasks you will be doing that day.
- It watches your patterns and helps you course correct. For example, you smoke when you did not sleep well or exersise(I've been clean for 2 months after working on quiting for a long time. This agent helped). There are many more examples.
- It works on your tasks and that reduces overwhelm. For tasks that only you can do, it breaks them down into manageable bits and if it discovers it can handle those bits, it does them as well. Fewer tasks = less overwhelm, better mood and reduces anxiety.
- It keeps you accountable. We often skip our routines and habits even on good days. And one or two skips for even legitimate reasons make it hard to get back. With gentle nudges, it will remind you these things and why you decided to make them routines and habits as well
- Adjusts to your day. Some days are harder than others, so we cannot do everything we said we were going to do. Unlike a calendar or task management app, it can tell you which ones are the most important.
- Sleep management. Following the past two points, it keeps you accountable with your sleep schedule. You can miss workouts or home cooked meals but when you work or stay up late into the night, it will definitely affect you.

⏱️ **Time to a working bot: ~2 hours** (copy-paste DIY), 15 min [with this script](https://buy.polar.sh/polar_cl_o4Tuaepm65AqQgHWUKW7K9vmlO9mvxANJXpvV2MRLva) or get on a call for more complex setups.
TODO: For the last CTA in the line above, add a link to the done for you section

> 📩 **Want this running in 15 min?** [Get the one-click deploy kit →](https://buy.polar.sh/polar_cl_o4Tuaepm65AqQgHWUKW7K9vmlO9mvxANJXpvV2MRLva)

---

## Cost Breakdown — No Surprises

| Item | Monthly Cost | Notes |
|------|-------------|-------|
| Model provider (The AI engine) | $0–10 | **Free:** Nous Portal (Quick Setup). **~$10:** OpenCode for pay-per-use |
| Server | $5 | Hetzner, DigitalOcean, or similar |
| Telegram Bot API | $0 | Free, unlimited messages |
| Hermes Agent | $0 | Open source, MIT licensed |
| Workflow prompts | $0 | Free, included in this repo |
| **TOTAL** | **$0–15/mo** | Start free, upgrade if you want |


## 🎁 FREE: Three Ready-to-Use Workflows

Steal these. They're the exact prompts I use every day.

| Workflow | What happens |
|----------|-------------|
| **🌅 Morning Anchor** | 7am check-in. "What's one thing today?" Sets the day's tone in 30 seconds. |
| **📊 Daily Check-in** | Evening 3-question log. Mood, energy, wins. Voice notes or one-word texts work. |
| **🌙 Evening Wind-Down** | 9:30pm nudge. Protects your sleep — the single most important factor for mood stability. |

[Get the here →](WORKFLOWS.md#free-workflows)

---

### [🔒 Premium](WORKFLOWS.md#premium-workflows)
| Workflow | What it does |
|----------|-------------|
| **⚠️ Burnout Early Warning** | Analyzes 7 days of your data. Detects pre-crash trajectories and alerts you before you lose weeks. |
| **🧩 Task Unstucker** | Frozen on a task? Breaks it into 15-minute micro-steps so step 1 takes zero willpower. |
| **💼 Job Hunt Assistant** | Searches for roles, customizes resumes, gives you copy-paste-ready applications. |


[Or get them individually →](WORKFLOWS.md#premium-workflows) — $10
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

**🚀 Quick start:** [SETUP.md — free guided walkthrough](SETUP.md) (works with your phone alone).
**🔧 Detailed guide:** [INSTALL.md — guided installation](INSTALL.md).


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


| | | |
|:--:|:--:|:--:|
| ### 💼 Starter Pack | ### ⚡ Done-For-You 🏆 | ### 🎯 Premium |
| **$60** | **$199** | **$599** |
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
| [Get Starter →](https://buy.polar.sh/polar_cl_o4Tuaepm65AqQgHWUKW7K9vmlO9mvxANJXpvV2MRLva) | [Get Done-For-You →](https://buy.polar.sh/polar_cl_S54SOTeMABojUgsNYT1hPMViHnczfM2Bkr7IK2HDTtn) | [Get Premium →](https://buy.polar.sh/polar_cl_9qFE7mpFbSAMoTcb5l0fl9QOMsfpfylfyQPzv1UpTQn) |


> **🛡️ Risk reversal:** Not happy with your purchase? Full refund, no questions asked — just email **kevinyosef54@gmail.com**. I'd rather you have a working system than keep your money.

> 📅 **After you pay:** you'll get a booking link to schedule your setup call (Done-For-You & Premium). The call is where we do the work together — no sales pitch, just setup.

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
