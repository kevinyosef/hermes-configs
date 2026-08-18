# Product Marketing Context

**Document version:** v1
**Last updated:** 2026-08-18

## Product Overview
**One-liner:** An AI agent that checks on you — built for ADHD & Bipolar brains (README H1).

**What it does:** A free repo (docs + configs) for the open-source [Hermes Agent](https://github.com/nousresearch/hermes-agent) that turns it into a personal check-in/accountability companion for people with Bipolar, ADHD, Depression, Chronic Fatigue, and burnout. The agent runs on a server, talks to you over any messaging app (Telegram, WhatsApp, Slack, Email, iMessage), checks in daily at set times, journals your answers, breaks daunting tasks into manageable bits (doing the ones it can handle itself), watches your patterns and helps you course-correct, keeps you accountable for routines/habits/sleep, and adjusts to how hard your day is. You mostly review and approve agent task completion — you can "complete tasks from bed." Explicitly NOT therapy: no medical advice (README disclaimer).

**Product category:** AI check-in / accountability companion for neurodivergent people; self-hosted personal AI assistant for task management and habit adherence. (Users find it alongside task managers, habit/mood trackers, and AI-assistant products.)

**Product type:** Primarily an open-source configuration/documentation product (free) plus paid one-time done-for-you setup *services* sold via Polar.sh checkout links.

**Business model:** Freemium. Free repo: install guides, 3 free workflow prompts (Morning Anchor, Daily Check-in, Evening Wind-Down), one-click deploy script. Paid one-time offerings: Starter Pack $60, Done-For-You $199, Premium $599; premium workflows (Burnout Early Warning, Task Unstucker, Job Hunt Assistant) $10 each individually or included in setup packages. Underlying monthly costs the buyer pays: model provider $0–10, server ~$5 (VPS). Refund policy: full refund, no questions asked (README).

## Target Audience
**Target companies:** None — B2C. Individual consumers living with Bipolar disorder, ADHD, Depression, Chronic Fatigue, burnout. Implied secondary: caregivers/supportive others are not addressed in the repo.

**Decision-makers:** The individual buyer themselves (self-serve purchase). The founder is the only seller/operator (single-operator, community via Discord/Reddit/email).

**Primary use case:** Task initiation and task completion for people whose executive function, energy, or motivation is impaired — keeping life "in check" (tasks, routines, habits, sleep, addiction recovery) without overwhelm.

**Jobs to be done:**
- Keep me accountable so I don't skip routines and habits ("keeps you accountable")
- Break my daunting task list into manageable bits so I can start ("get the lists un-daunting")
- Check in on me daily, journal how I'm doing, and watch my patterns to course-correct
- Do the tasks it can handle so I have fewer tasks and less overwhelm ("complete tasks from bed")

**Use cases:**
- Morning Anchor — 7am, "What's one thing today?", sets the day's tone in 30 seconds
- Daily Check-in — 8pm, 3-question mood/energy/wins log (voice notes or one-word texts work)
- Evening Wind-Down — 9:30pm bedtime nudge; protects sleep, "the #1 lever for mood stability"
- Burnout Early Warning (premium) — weekly analysis of 7 days of data; detects pre-crash trajectories and alerts you before you lose weeks
- Task Unstucker (premium) — breaks frozen tasks into 15-minute micro-steps so step 1 takes zero willpower
- Job Hunt Assistant (premium) — searches for roles, customizes resumes, copy-paste-ready applications, limits to 3/day to prevent burnout

## Personas
B2C product — the buyer, user, and champion are the same person. No multi-stakeholder B2B buying process. Buyers segment by setup tier rather than role:

| Segment | Cares about | Challenge | Value we promise |
|---------|-------------|-----------|------------------|
| DIY / Starter ($60) | Free/cheap start, one-click deploy, not too technical | Wants the working bot without a 2-hour manual install | Paste 1 file, live in 4 min; 15-min video walkthrough; 1-week email support |
| Done-For-You ($199) | Not touching the terminal at all | Wants it working without learning SSH/terminal | I install everything, customize to YOUR routine, test live; 2-week follow-up support; "most popular — just works" |
| Premium ($599) | A long-term partner; professionals | Wants ongoing tuning, ND-specific adjustments, integrations, crisis safety | 5 custom workflows, monthly check-in calls (3 months), ND-specific tuning (executive function, RSD, focus), monthly pattern report, crisis escalation, priority support |

## Problems & Pain Points
**Core problem:** Task lists get daunting, apps get ignored on rough days, and tasks keep accumulating — especially for people with Bipolar, ADHD, Depression, Chronic Fatigue, or burnout. Task paralysis is "an executive function wall," not a willpower problem. Patterns that lead to crashes are invisible to the person "too deep in the fog to notice."

**Why alternatives fall short:**
- Todoist, Notion, Reclaim, Motion "get often ignored on rough days" — passive tools that wait for you to remember them
- "Standard mood trackers show you the data" — they don't interpret it or warn you in time to act
- A calendar or task management app can't tell you which task matters most on a hard day — they don't adjust to your day
- Traditional job-hunt workflow is "search → get overwhelmed → procrastinate → self-blame → repeat"; most people burn out within 2–3 days

**What it costs them:**
- Weeks of life lost to depressive crashes that weren't caught in time (founder: "losing 3-week blocks to depressive crashes I didn't see coming")
- Lost days instead of done tasks ("the difference between a lost day and a done task")
- Burnout from job hunting within 2–3 days; months/years of unemployment (founder: "two years without a job")
- Skipped routines/habits where one or two skips make it hard to get back
- Poor sleep degrading mood stability ("when you work or stay up late into the night, it will definitely affect you")

**Emotional tension:** Overwhelm, anxiety, decision paralysis ("Everything feels heavy"), shame (motivational language "triggers shame in depressed states"), guilt ("guilt-trippy" check-ins), self-blame from procrastination, feeling frozen and unable to start.

## Competitive Landscape
**Direct:** Todoist, Notion, Reclaim, Motion — same "manage my tasks/life" job — fall short because they get ignored on rough days and don't initiate; the lists stay daunting and tasks accumulate.
**Secondary:** Standard mood trackers / habit & routine apps — they log data but don't interpret it or warn about pre-crash trajectories; no accountability, no task completion.
**Indirect:** Consulting an AI for therapy/medical advice — explicitly rejected by the founder ("I am opposed to AI therapy"); human therapists/doctors — out of scope, not a substitute and not positioned as one. Also: a human personal assistant / accountability partner — more expensive and not always available; [GAP: repo doesn't address this comparison].

## Differentiation
**Key differentiators:**
- The agent initiates — it "checks on you instead of waiting for you to remember it exists"
- Works on your tasks itself, breaking them into manageable bits and doing the bits it can — "Fewer tasks = less overwhelm, better mood and reduces anxiety"
- Watches your patterns and helps you course-correct (e.g., flags smoking when you slept badly; founder: clean for 2 months with the agent's help)
- Adjusts to your day — tells you which tasks are most important when you can't do everything; unlike a calendar or task app
- Keeps you accountable with gentle nudges, including sleep ("Sleep is non-negotiable tonight")
- Data-backed personalization: "Your check-ins show better days after 7+ hours of sleep"
- Local-first privacy: everything stored locally in plain markdown; no cloud except Telegram messages and model API calls; no lock-in
- Free to start ($0–15/mo all-in), open source, works on any messaging app
- Built from lived experience with Bipolar + ADHD ("built from lived experience")

**How we do it differently:** Instead of a passive app you must remember to open, it's an active conversational agent that checks in at set times via a messaging app you already use, with tone rules tuned for crisis brains ("Warm, not cheery... Direct, not motivational"). Non-clinical, human-feeling messaging rather than "a clinical alert."

**Why that's better:** Fits how neurodivergent users actually function on bad days — accepts voice notes, single words, "nothing," no reply; small wins counted as wins; no guilt, no follow-up pressure; protects sleep; catches patterns the user can't see.

**Why customers choose us:** Accountability without shame, task lists that get un-daunting, patterns caught before crashes, and the ability to "complete tasks from bed" — for a $0–15/mo all-in cost, with done-for-you setup if they're non-technical.

## Objections
| Objection | Response |
|-----------|----------|
| "Is my data private?" | Yes. Everything is stored locally on your machine; only your Telegram messages (encrypted) and model-provider API calls leave it (README FAQ). |
| "I'm not technical at all. Can I still do this?" | Yes — that's what the setup services are for. You don't touch the terminal; I set it up, test it, and hand you a working system. |
| "Can I run this without a VPS?" | Yes — Path 1 (Linux/Mac) or Path 2 (Windows) runs on your personal computer; it only needs to be ON at check-in times. Path 3 gives 24/7 for ~$5/mo. |
| "Can I customize the check-in questions?" | Absolutely — every workflow is a simple markdown file, or just tell the bot ("change my morning check-in to 9am"). |
| "Is this AI therapy?" | No. Explicitly not — the founder is opposed to AI for medical advice; this only helps you keep your life in check (README disclaimer). |
| "It costs monthly (VPS + model)?" | Total is $0–15/mo; free model tier via Nous Portal Quick Setup and $5 server. One-time setup services are separate. |
| "Will it judge me if I skip?" | No — designed to never be guilt-trippy; no reply is logged silently as "no response," and shows up only as pattern data. |

**Anti-persona:** People seeking AI therapy or any medical/psychiatric advice (explicitly out of scope and discouraged — the founder warns you "can accidentally get carried away" in health chats). People who will not engage with the check-ins at all (the system needs you to reply; the founder's caveat: you still do the work, the agent helps). People who want a zero-maintenance hosted SaaS with no server, no engagement, and no setup cost. People who want a hard requirement of 24/7 reliability without paying ~$5/mo for a VPS or keeping a machine on.

## Switching Dynamics
**Push:** Existing apps (Todoist, Notion, Reclaim, Motion) get ignored on rough days; tasks keep accumulating; lists are daunting; mood trackers show data but never warn you in time; routines and habits keep slipping after one or two skips; job hunting burns people out in 2–3 days; weeks are lost to crashes that weren't caught.
**Pull:** The agent checks in on you instead of waiting for you; task lists get broken down and "un-daunting"; "fewer tasks = less overwhelm, better mood and reduces anxiety"; it watches patterns and helps course-correct; it tells you what matters most on a hard day; sleep is protected; you can complete tasks from bed; free to start and private by default.
**Habit:** Existing task apps/trackers are already installed and feel "good enough"; the habit of self-reliance / "I should just do it myself"; the job-hunt pattern of "search → get overwhelmed → procrastinate → self-blame → repeat"; for non-technical people, the habit of avoiding terminal/SSH.
**Anxiety:** Technical setup fear (terminal, SSH, VPS) — addressed by done-for-you tiers and plain-language guides; privacy concerns — addressed by local storage; monthly cost surprises — addressed by transparent cost breakdown ($0–15/mo); fear it's AI therapy or will be cold/judgmental — addressed by tone rules and the disclaimer; fear of a system that needs maintenance — addressed by auto-restart, `/checkin` health check, and 2-week support window.

## Customer Language
**How they describe the problem:**
- "the apps we use... get often ignored on rough days, tasks keep accumulating and we leave them for a long time because the lists are daunting"
- "the lists are daunting"
- "I can't start" / "stuck" / "everything feels heavy"
- "I just want to stay in bed"
- "task initiation" / "task completion" / "task paralysis"
- "frozen. Not lazy. Not procrastinating. Your brain just won't let you take the first step."
- "search → get overwhelmed → procrastinate → self-blame → repeat"

**How they describe us:**
- "An AI Agent That Checks on You"
- "check in on you" / "It checks in on you on a daily basis to know how you are doing"
- "keeps you accountable"
- "get the lists un-daunting"
- "less overwhelm, better mood and reduces anxiety"
- "watches your patterns and helps you course correct"
- "complete tasks from bed"
- "It's like texting a friend who always answers"
- "a warm and direct morning accountability partner"

**Words to use:** check in on you, accountability, gentle nudges, task initiation, manageable bits, small wins, patterns and course correct, less overwhelm / reduces anxiety, sleep is the #1 lever, mood stability, complete tasks from bed, warm and direct, plain words, no terminal, "What's one thing today?", crisis brains, executive function.

**Words to avoid:** therapy, therapist, medical advice, clinical alert, motivation/motivational quotes ("motivational language triggers shame in depressed states"), cheery/upbeat, guilt-trippy, coach, and anything that implies medical or psychological treatment.

**Glossary:**
| Term | Meaning |
|------|---------|
| Hermes Agent | The open-source (MIT) AI agent framework this product configures |
| Gateway | The always-on daemon that connects the agent to Telegram and runs scheduled check-ins |
| Workflow | A markdown file / prompt that defines one check-in behavior (e.g., Morning Anchor) |
| System Prompt | The prompt block (free workflows) that is pasted to the bot during setup |
| Check-in | A scheduled message from the agent (morning, evening, wind-down, /checkin) |
| VPS | A small always-on rented server (~$5/mo, Hetzner/DO) for 24/7 operation |
| Model provider | The "brain" — Nous Portal (free) or OpenCode (~$10/mo pay-per-use); deepseek-v4-flash-free / deepseek-v4-pro are the documented default models |
| Dashboard (webui) | A private browser journal of all chats and check-ins, reached via Tailscale |
| Tailscale | Free secure private network connecting your devices to the server |
| One-click deploy kit | The `deploy/bootstrap.sh` pasted as cloud-config/user-data to get a bot live in ~4 min |
| Polar / checkout link | Billing platform and buy URLs used for the paid tiers and premium workflows |

## Brand Voice
**Tone:** Warm, honest, direct; human and lived-experience first; plain and non-technical; explicitly not clinical, not "cheery," not "motivational." ("Warm, not cheery... Direct, not motivational... Like a friend who's been through it — not a coach.")

**Style:** Conversational, plain words, beginner-friendly; short sentences; concrete examples; friendly emojis in marketing docs; talks to the reader as a peer with shared experience ("for people like me").

**Personality:** Warm, honest, practical, non-judgmental, lived-experience-driven.

## Proof Points
**Metrics:**
- Founder's lived-experience anecdotes (self-reported in README/workflow files; NOT independent metrics): "I've been clean for 2 months after working on quitting for a long time. This agent helped"; "I'm now already doing interviews :)"; "Been getting freelance clients as well"; job hunt + resume customization that "would have burnt me out in 3 days"; built Burnout Early Warning "after losing 3-week blocks to depressive crashes I didn't see coming"; Task Unstucker is "the workflow I use multiple times a week"; Job Hunt built "after two years without a job."
- [GAP: no external/quantified metrics — no install counts, user counts, conversion, or revenue figures in the repo]

**Customers:**
- [GAP: no named customers or logos; no independent customer names in the repo]
- Community channels exist (Discord, Reddit DMs, email kevinyosef@proton.me) but no member counts are published

**Testimonials:**
- [GAP: need real testimonial quotes — none in the repo. Only the founder's first-person anecdotes above.]

**Value themes:**
| Theme | Proof |
|-------|-------|
| Reduces overwhelm | Agent works on tasks, breaks them into manageable bits — "Fewer tasks = less overwhelm, better mood and reduces anxiety" |
| Keeps you accountable | "It keeps you accountable... With gentle nudges, it will remind you these things and why you decided to make them routines" |
| Catches patterns / course-corrects | "It watches your patterns and helps you course correct... you smoke when you did not sleep well" (founder: clean 2 months) |
| Protects sleep | Evening Wind-Down + data-backed nudge; "sleep is the single most important factor for mood stability" |
| Task completion from bed | Agent does tasks it can handle; "You will mostly be reviewing and approving agent task completion" |
| Private & low-cost | Local markdown storage, no lock-in; $0–15/mo all-in; open-source, MIT |
| Made by someone who lives it | "Built from lived experience with Bipolar disorder & ADHD" |

## Goals
**Business goal:** Sell the one-time Polar.sh setup services (Starter $60 / Done-For-You $199 / Premium $599) and premium workflows ($10 each); grow an engaged community of neurodivergent users (Discord, Reddit, email) and funnel free users into paid setup tiers.

**Conversion action:** Primary — clicking a Polar checkout link (`https://buy.polar.sh/polar_cl_...`) to buy a setup tier or premium workflow; secondary — joining the Discord, DMing on Reddit, emailing for help, or self-installing the free workflows (which build trust for later upsell).

**Current metrics:** [GAP: no sales, traffic, or conversion metrics published in the repo].

## Changelog
*Newest first. One line per revision: what changed and why.*
- v1 (2026-08-18) — Initial context.
