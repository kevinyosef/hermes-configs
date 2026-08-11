# 🧭 Your Hermes Agent — A Friendly Owner's Manual

Welcome. You now own a small piece of your own AI — one that checks on **you** instead of waiting for you to remember it exists.

This guide is written for a non-technical person, on purpose. No step here requires you to know what SSH or a terminal is. The few commands that exist are explained in plain words, one line at a time.

> **TL;DR:** Talk to your bot on Telegram. That's 95% of daily life. Everything else in this guide is for the rare moment something feels off.

---

## 📋 Your System at a Glance

You have three pieces that do one job together:

| Piece | What it is | When you use it |
|-------|------------|-----------------|
| 💬 **Telegram bot** | Your agent, in the chat app you already use | Every day — this is your front door |
| 🖥️ **The dashboard (webui)** | A browser inbox of all your past chats and check-ins | Occasionally — reading, not daily |
| 🗄️ **The server (VPS)** | A tiny always-on computer that runs the agent 24/7 | Never — it just works, ~$5/mo |

### 💬 The Telegram bot — your front door

- The agent lives in Telegram under the bot name you chose. Talk to it like a friend: plain words, voice notes, anything.
- It's the **only** piece you need for daily use. You don't open apps, you don't log in — you just message it.
- Only your Telegram account can talk to it. The bot ignores everyone else, so it's private to you.

### 🖥️ The dashboard — your browser inbox

- Every conversation, every check-in answer, every session is saved and visible here — like a searchable journal of your life with the agent.
- It lives at a private address that looks like this:

  ```
  http://hermes.<your-tailnet>.ts.net:8787
  ```

- **To open it:** your phone (or computer) must be connected to the **Tailscale app** — the same account used during setup. Find the device named `hermes` in the Tailscale app — the exact address shown there is your dashboard address, with `:8787` on the end.
- The dashboard is private by design: it has no public internet address. Only your own devices, through the Tailscale app, can reach it.
- Password: the one you picked during setup.

### 🗄️ The server — the always-on computer

- It's a small rented computer in a data center (~$5/mo from your VPS provider). It runs your agent every hour of every day.
- Even when your phone is off or your laptop is closed, check-ins still fire on time. That's the whole point of it.
- You will almost never touch it. When you do, the later sections tell you exactly what to click and what to type.

---

## ☀️ Daily Use

- **Check-ins arrive to you.** You don't start conversations — the agent messages you at the times you set. When it does, reply however it suits you that day: a full paragraph, one word, or a voice note. All of it works.
- **Message it anytime you need:** *"I'm stuck and can't start,"* *"what was I supposed to do today?"*, *"talk me through this task."* It's like texting a friend who always answers.
- **`/checkin`** — the magic test command. Send it to your bot any time. Two things happen: the agent runs a check-in with you right now, and you instantly know the system is alive (if it replies, everything is working).
- **"list my scheduled check-ins"** — ask this to see every check-in time the agent has scheduled.

### The classic check-in times

These are the defaults your prompts set up. Yours may have been tuned during your setup call — ask your bot to list them to see your actual schedule.

| Check-in | Time | What it does |
|----------|------|--------------|
| 🌅 **Morning Anchor** | 7:00 AM | "What's one thing today?" — sets the day's tone in 30 seconds |
| 📊 **Daily Check-in** | 8:00 PM | A short log: mood, energy, wins. Voice notes or one-word texts work |
| 🌙 **Evening Wind-Down** | 9:30 PM | A bedtime nudge — sleep is the #1 lever for mood stability |

Your answers are saved into your personal journal on your server. Over time, that history is what lets the agent spot patterns for you (like the premium Burnout Early Warning, which reads 7 days of your data).

### A gentle first-week rhythm

- [ ] Day 1: Reply to every check-in, even if it's just "ok"
- [ ] Day 2: Send one voice note instead of typing
- [ ] Day 3: Ask for one change (see the next section) — feels great to see it obey
- [ ] Sometime this week: open the dashboard once, just to see your journal

---

## 🎛️ Customizing Your Workflows

**Just ask.** This is the best part — no settings screens, no files to edit.

Your agent schedules and manages its own check-ins using its built-in scheduler, and it updates its own workflow files whenever you change something. You steer it entirely through conversation:

> - "Change my morning check-in to 9am"
> - "Add a question about food to my evening check-in"
> - "Don't check in on Sundays"
> - "Make the morning check-in shorter"
> - "You're too formal — be warmer"

It confirms when it's scheduled or changed. Double-check anytime with **"list my scheduled check-ins."**

### For the curious: where your agent's world lives

You never need to touch these files — but it's nice to know you *could*, because they're plain text and completely yours:

- Everything is stored in a protected storage area called the **`hermes-data` volume** on your server (mounted at `/opt/data` inside the agent).
- Inside: your journal and session history as **plain markdown files**, your settings in `config.yaml`, and your agent's state in `profiles/default/`.
- That's it — no proprietary format, no lock-in. If you ever wanted to, you could read or export any of it.

---

## 🖥️ The VPS Server

**What it is:** a small computer in a data center, rented by the month (~$5/mo from Hetzner, DigitalOcean, or similar). It runs your agent, its scheduler, the dashboard, and the private network that connects them.

**Why it costs ~$5/mo:** you're renting a machine that is on 100% of the time. That's the entire trick — check-ins fire even when you're asleep, offline, or having a day where you can't open anything. For comparison, it replaces subscriptions that cost far more, and you own the whole thing.

**What happens if the server reboots** (power blip, provider maintenance, or your provider restarts it): nothing you need to do. All three services are set to **restart automatically** (`restart: unless-stopped`). Give it 2–3 minutes to come back, then send `/checkin`. If the bot replies, it's fully back.

**How to check it's alive:**

1. **Easiest (do this first):** send `/checkin` on Telegram. Reply = alive.
2. **From your provider's web console:** log in to your VPS provider's website, open your server, click **Console** (Hetzner) / **Web console** (DigitalOcean) — a terminal opens in your browser — then run:

   ```bash
   cd /opt/hermes-stack && docker compose ps
   ```

   You should see your three services (`hermes`, `hermes-webui`, `tailscale`) with `Up` in the status column.
3. **Quick health check** (same console):

   ```bash
   curl http://localhost:8642/health
   ```

   A healthy agent answers `{"status":"ok"}`.

---

## 🔄 Keeping Things Updated

Updates are rare and safe; your data is never touched. Once every few months is plenty.

You run two commands **on the server** (in your provider's web console — the Console button in your server dashboard — or over SSH if you're comfortable with it):

```bash
cd /opt/hermes-stack && docker compose pull && docker compose up -d
```

What that actually does, in plain words:

| Part | Meaning |
|------|---------|
| `cd /opt/hermes-stack` | "Go to the folder where your system lives" |
| `docker compose pull` | "Download the newest versions of the three apps" |
| `docker compose up -d` | "Switch everything over to the new versions, in the background" |

- Your journal, sessions, and settings are stored separately (in the `hermes-data` volume) and **persist across every update** — nothing is lost or reset.
- After updating, send `/checkin`. A reply means the new version is running happily.

---

## 💾 Backups

The only truly irreplaceable thing you own here is **your agent's data** — journals, check-in answers, session history — which lives in the `hermes-data` volume.

### ✅ The easy option: a provider snapshot (recommended)

Your VPS provider's dashboard has a **Snapshot** feature (Hetzner, DigitalOcean, and similar all have one). One or two clicks, and it copies your **entire server** — agent, data, settings, everything. If something ever goes wrong, you restore the snapshot with a click. This is the beginner-safe choice, and it's genuinely the best protection. Do it monthly (or whenever you remember — once is already better than never).

### 📦 The precise option: a single-file backup

Want your journals as one file you can hold and download? Run this **on the server** (same console as above, from the `backup` folder's parent directory):

```bash
cd /opt/hermes-stack && docker run --rm -v hermes-data:/opt/data -v $(pwd)/backup:/backup alpine tar czf /backup/hermes-backup-$(date +%F).tar.gz -C /opt/data .
```

Plain words: this creates **one compressed file containing everything the agent knows**, saved to a `backup` folder on your server with today's date in its name (e.g. `hermes-backup-2026-08-11.tar.gz`). You can download that file to your computer for safekeeping — it's the entire agent brain, in one zip.

**To restore it later:** extract the file back into the same storage area. Swap in your file's date:

```bash
cd /opt/hermes-stack && docker run --rm -v hermes-data:/opt/data -v $(pwd)/backup:/backup alpine tar xzf /backup/hermes-backup-2026-08-11.tar.gz -C /opt/data
```

**My recommendation:** do the snapshot. If you also want portable copies of your journals, run the file command now and then whenever you think of it. Both together = bulletproof.

---

## 🛠️ Troubleshooting

First, the 95% rule: **send `/checkin`.** If the bot replies, everything is working — even if some part of the dashboard looks odd.

| Symptom | Try this |
|---------|----------|
| **Bot doesn't reply** | On the server, run `docker logs hermes \| tail -100`. The usual cause is a wrong bot token (`BOT_TOKEN`) or wrong user ID — easiest to fix during a support call. Don't worry, data is safe. |
| **Bot was down, server rebooted** | Wait 2–3 minutes for the services to restart themselves, then send `/checkin` again. |
| **Dashboard (webui) won't load** | Make sure your phone is connected to the **Tailscale app** and you're using the exact address from the app. On the server, `docker logs tailscale` shows whether the private network started; a missing/expired key (`TS_AUTHKEY`) means the provider may need to regenerate it on a support call. |
| **Dashboard opens but shows no chats** | In the dashboard, open **Settings** and enable **"show previous messaging sessions"**. |
| **Dashboard crashes on open** | On the server, run `docker logs hermes-webui` — if it mentions `WANTED_UID/GID`, the file-permission IDs don't match the server user (default is `1000`). Bring the log to a support call and we'll fix it in minutes. |
| **Forgot the dashboard password** | It's stored on the server in `/opt/hermes-stack/.env` — the line `WEBUI_PASSWORD=...`. Read it there, or change that line to a new password and run the update command from the Updating section to apply it. |
| **Server never finished first boot / something's badly wrong** | The setup is designed to be safely re-runnable — delete the server and create a new one with the same file you pasted. Or just come to us and we'll walk you through it. |
| **Anything else at all** | See **Getting Help** below. No question is too small. |

---

## 📬 Getting Help

You are not alone with this, and nothing here is a "you problem" to figure out solo.

1. **Try the bot itself:** `/checkin`, and "list my scheduled check-ins". Surprisingly often, that's the whole fix.
2. **Email: kevinyosef@proton.me** — direct line to the person who built and set up your system. Replies usually within a few hours.
3. **Open an issue:** [github.com/kevinyosef/hermes-configs/issues](https://github.com/kevinyosef/hermes-configs/issues)
4. **DM on Reddit:** [reddit.com/message/compose?to=kevinyosef](https://reddit.com/message/compose?to=kevinyosef)

And remember: your setup package includes a **2-week follow-up support window** — bug us early and often during it. That window exists precisely so you never sit stuck for even one day after setup.

---

That's the whole manual. You paid for a system that runs itself so you don't have to think about it — so go use the fun part: message your bot, answer today's check-in, and let it carry some of the weight. You've got this. 💙