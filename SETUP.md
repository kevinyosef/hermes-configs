# 🛠️ SETUP — Connect Your Agent in 15 Minutes

**Follow this top to bottom. Every step is copy-paste.**

> **What you're doing:** 1) Give your agent a brain (model provider). 2) Connect it to Telegram. 3) Paste 3 setup prompts — the agent configures your check-ins by itself. No file editing. No terminal knowledge needed.

---

## Part 1 — Connect the Brain (One Command)

Open your terminal (Linux/Mac/Windows PowerShell) and run:

```bash
hermes setup
```

**You'll see a menu. Pick whichever fits you:**

| Option | What it is | Cost |
|--------|-----------|------|
| **Quick Setup (Nous Portal)** | Official free path. Logs you in with Google/GitHub. 300+ models included. **No API key needed.** | Free |
| **Full Setup** | Walk through every provider yourself (bring your own key) | varies |
| Blank Slate | Tech-advanced only. Skip this for now. | — |

**Can't decide?** Pick **Quick Setup (Nous Portal)**. It's free, it's safe, and you can switch providers later anytime with:

```bash
hermes model
```

> **🆘 Stuck?** If `hermes` says "command not found": close the terminal, open a NEW one, try again. If it still fails, see the FAQ in the main README.

---

## Part 2 — Connect Telegram (One Command)

```bash
hermes gateway setup
```

Follow the prompts:

1. **Platform:** choose `Telegram`
2. **Bot token:** from earlier — if you haven't created your bot yet, go to Telegram, search **@BotFather**, send `/newbot`, name it, and it gives you a token like `7123456789:AAHdqTcvCH1sGWQ...`
3. **Allowed users:** your numeric ID from **@userinfobot** (send it any message)

Then start it:

```bash
hermes gateway start
```

**Test it:** open Telegram, message your bot anything ("hello"). It replies within seconds. 🎉

> If it doesn't reply, jump to the [Troubleshooting checklist](#troubleshooting) at the bottom.

---

## Part 3 — The Setup Prompts (Copy the Full Workflows)

The short prompts are nice, but the **full workflow prompts** in this repo are the real deal — they contain the rules, tone, and examples that make the agent feel human. Copy those instead.

**Here's the pattern for each workflow:**

### 🌅 Workflow 1 — Morning Anchor (do this first)

1. Open **`workflows/morning-anchor.md`** in this repo (tap it in the file list, or [click here](workflows/morning-anchor.md)).
2. Find the **System Prompt** block — it's the text inside the grey box under the `## System Prompt` heading.
3. Copy ALL of it. On GitHub, hover the code block and tap the **copy icon** (top-right corner of the box) — no need to select text manually.
4. Paste it to your bot, then add this instruction:

> — and set this up as a recurring check-in every day at 7:00 AM. Confirm when it's scheduled.

### 📊 Workflow 2 — Daily Check-In

1. Open **`workflows/daily-checkin.md`** ([click here](workflows/daily-checkin.md)) and copy the System Prompt block the same way.
2. Paste it to your bot, then add:

> — and set this up as a recurring check-in every day at 8:00 PM. Confirm when it's scheduled.

### 🌙 Workflow 3 — Evening Wind-Down

1. Open **`workflows/evening-winddown.md`** ([click here](workflows/evening-winddown.md)) and copy the System Prompt block.
2. Paste it to your bot, then add:

> — and set this up as a recurring reminder every day at 9:30 PM. Confirm when it's scheduled.

**That's it. You now have an AI companion that checks on YOU — with the full personality and rules baked in — every day, on the app you already use.**

> 💡 **Not on GitHub?** If you cloned the repo, the files are in the `workflows/` folder on your machine — open them in any text editor and copy from there.

> 💡 **Want changes?** Just tell the bot: "change my morning check-in to 9am" or "add a question about food." The agent updates it on the spot.

---

## The Premium Workflows

The three workflows above are free. There are three more powerful ones — **Burnout Early Warning** (catches crashing patterns before you lose weeks), **Task Unstucker** (breaks frozen tasks into 5-minute steps), and **Job Hunt Assistant** (finds and prepares applications for you).

They're available with the [Done-For-You Setup](https://github.com/kevinyosef/hermes-configs) — where I install everything, customize it to your routine, and test it with you live. [Message me on Reddit](https://www.reddit.com/message/compose?to=kevinyosef).

---

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| Bot doesn't reply | Run `hermes gateway status`. If "stopped": `hermes gateway logs --tail 20` — likely a wrong bot token (copy-paste it again from BotFather) |
| Bot replies but "I can't schedule that" | The agent needs its tools enabled: run `hermes tools` in your terminal, make sure **cron** is enabled, then try the prompt again |
| Check-ins don't fire at the right time | Tell the bot "list my scheduled check-ins" — it will show them. Your computer/server must be ON at that hour (see Path 3 in the README for 24/7) |
| I want to see everything on a dashboard | The agent will have a web dashboard at `http://localhost:8080` (or your server IP if on a VPS) |

---

Go to [Part 1](#part-1--connect-the-brain-one-command) if you haven't started.