# Workflows Reference

Every workflow in this repo — what it does, how to install it, how to customize it.

## Free Workflows

These are ready to use. Copy the file into your Hermes config directory after setup (see [INSTALL.md](INSTALL.md)).

| Workflow | File | What it does |
|----------|------|-------------|
| 🌅 Morning Anchor | `workflows/morning-anchor.md` | 7am daily check-in — "What's one thing today?" Sets the day's tone in 30 seconds. |
| 📊 Daily Check-in | `workflows/daily-checkin.md` | Evening 3-question mood/energy/wins log. Voice notes or one-word texts work. |
| 🌙 Evening Wind-Down | `workflows/evening-winddown.md` | 9:30pm bedtime nudge. Sleep is the #1 lever for mood stability. |

### How to Install a Free Workflow

1. After running `hermes gateway setup` (see [INSTALL.md](INSTALL.md)), open Hermes' workflow/cron config.
2. Copy the contents of the workflow file into a new cron entry.
3. Set the schedule to match the workflow (7:00 for Morning Anchor, 20:00 for Daily Check-in, 21:30 for Evening Wind-Down).
4. Restart the gateway: `hermes gateway restart`.

### How to Customize

Every workflow is plain text. Change the questions, the time, the tone — anything. The instructions inside each file tell you what each part does.

---

## Premium Workflows

These ship as part of the [Done-For-You Setup](README.md#-done-for-you-setup-services) (or individually via the Starter Pack). The files in `workflows/` are descriptions — the full prompts are delivered during setup so they're tuned to *your* life.

| Workflow | File | What it does |
|----------|------|-------------|
| ⚠️ Burnout Early Warning | `workflows/burnout-detection.md` | Weekly analysis of your check-in data. Detects pre-crash trajectories and alerts you before you lose weeks. |
| 🧩 Task Unstucker | `workflows/task-unstucker.md` | Frozen on a task? Breaks it into 15-minute micro-steps so step 1 takes zero willpower. |
| 💼 Job Hunt Assistant | `workflows/job-hunt.md` | Searches for roles, customizes resumes, gives you copy-paste-ready applications. |

[Get them →](README.md#-done-for-you-setup-services)