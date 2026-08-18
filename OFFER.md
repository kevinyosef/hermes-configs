# OFFER.md — Offer Audit & Recommendations

**What this file is:** an internal audit of the current offer (the paid product: a Hermes Agent Telegram check-in bot for ADHD / Bipolar / depression / chronic fatigue). Diagnosis, concrete changes, and a sequence to implement them. Prices are unchanged throughout — nothing here raises or lowers a number.

**Source of truth:** README.md, WORKFLOWS.md, POLAR_PRODUCTS.md, and the `workflows/*.md` files as they exist in this repo.

---

## 1. Current offer, stated plainly

Three one-time tiers, plus three premium workflows sold individually:

| Tier | Price | What it includes |
|------|-------|------------------|
| **💼 Starter Pack** | **$60** one-time | Full repo access, 5 workflow templates (Morning Anchor, Daily Check-in, Evening Wind-Down, Burnout Early Warning, Task Unstucker), the one-click deploy kit ("paste 1 file, live in 4 min"), a 15-min video walkthrough, 1 week of email support. Buyer installs. |
| **⚡ Done-For-You** | **$199** one-time | Everything in Starter, plus a 45-min live setup call, full installation on the buyer's machine/VPS, Telegram bot connected & tested, workflows customized to their routine, 2 weeks of follow-up support, a setup reference guide. Buyer still spends **2–4 hours of their own time** across the call (account creation, questions, personalization). Labeled **"Most popular — just works."** |
| **🎯 Premium** | **$599** one-time | Everything in Done-For-You, plus 5 custom workflows, monthly check-in calls for 3 months, priority support, custom integrations (Notion, Calendar, etc.), ND-specific tuning, a monthly pattern report (mood/energy/sleep trends), crisis escalation setup, custom tools & automations, 1:1 onboarding + usage coaching. |

**Premium workflows** (sold separately at **$10 each**): ⚠️ Burnout Early Warning, 🧩 Task Unstucker, 💼 Job Hunt Assistant. **Inclusion is now decided:** Burnout Early Warning and Task Unstucker ship with the Starter Pack (they're two of its five workflow templates) *and* with Done-For-You and Premium; Job Hunt Assistant ships with Done-For-You and Premium only (it's the tier differentiator). All three agree across README.md, WORKFLOWS.md, and `workflows/*.md`.

**Existing guarantee:** "Not happy with your purchase? Full refund, no questions asked — just email kevinyosef54@gmail.com. I'd rather you have a working system than keep your money." (README, one italic line below the pricing table.)

**Scarcity/urgency:** none anywhere. **Bonus stack:** none anywhere. **Overall offer name:** the tiers have names; the method does not.

**Cost to run** (from README): ~$0–15/mo per buyer (model + server).

---

## 2. Value equation diagnosis

```
              Dream Outcome  ×  Perceived Likelihood
  Value  =  ─────────────────────────────────────────
              Time Delay     ×   Effort & Sacrifice
```

| Lever | Score | Why |
|-------|:-----:|-----|
| **Dream outcome** | **7/10** | Strong and specific: "stop losing days and weeks to crashes," "get things done on my worst days," "interviews, freelance clients, 2 months clean." The free workflows already name the outcomes (morning anchor, sleep protection, mood stability). It's a little implicit — the "day after it works" picture could be drawn more concretely — but the material is there. |
| **Perceived likelihood** | **3/10** | **The binding constraint.** The only proof is the founder's own lived experience. No named customers, no numbers, no methodology name, and the universal objection is unaddressed: *"it worked for Kevin with bipolar + ADHD — will it work for me with depression / chronic fatigue / ADHD-only?"* The sample-of-one objection is real for a neurodivergent audience, and nothing on the page pre-empts it. The guarantee exists but is buried below the fold. |
| **Time delay** | **7/10** | Good. Free DIY is ~2 hours; Starter's deploy kit is "live in 4 min"; Done-For-You is call + same-session install. The only lag is booking the setup call. |
| **Effort & sacrifice** | **4/10** | The biggest non-price cost. Free DIY is 2 hours of terminal work — painful for this audience. Done-For-You still charges the buyer **2–4 hours of their time** (stated in README). For ADHD/depression, a 4-hour setup is a real wall, not a minor friction. Premium asks for 3 months of recurring call time. |

**Binding constraint:** **Perceived likelihood (3)** — the lowest, and the one everything else hangs off. Buyers don't doubt the offer exists; they doubt *it will work for them*. Fix that first. **Effort & sacrifice (4)** is the close second and is amplified by the audience (neurodivergent brains are already spending energy just to get through setup). It's the second lever to pull.

---

## 3. Offer anatomy audit

| Component | Status | Verdict |
|-----------|--------|---------|
| **1. Core deliverable** | Present, weakly framed | Each tier lists features, not outcomes. "45-min live setup call" doesn't say what the buyer walks out with. Frame every tier as the end-state: "you leave with a working bot on your phone, not homework." |
| **2. Bonus stack** | **Missing** | No bonuses at any tier. The $10 premium workflows are add-ons, not bonuses. This is the single largest anatomy gap — and easy to close without new checkout links. |
| **3. Guarantee** | Present, under-used | The promise is genuinely strong ("full refund, no questions asked"). But it's one italic line at the bottom of the table, far from the buy buttons, with no window and no delivery commitment. Sharpening + placement will lift perceived likelihood more than any other copy change. |
| **4. Scarcity / urgency** | **Missing** | None. There IS a real constraint: the seller personally runs live setup calls and 3 months of Premium calls. Capacity scarcity is honest, available, and appropriate. Do not invent anything else. |
| **5. Name** | Weak | Tiers are named (good) but they're generic descriptors ("Starter Pack," "Premium"). The *method* has no name — buyers can't say "I signed up for the ____." Naming the three daily check-ins as one system gives free users and buyers a repeatable thing to talk about. |
| **6. Price + payment** | Present, inflexible | One-time, pay-in-full only at all tiers. Fine for Starter ($60). For $199/$599, a 2-installment option would lower the barrier — but that requires a new Polar product/price (flagged below). Pricing ladder itself is sound (§5). |

---

## 4. Concrete recommendations

### 4.1 The one lever to fix first: **perceived likelihood**

Four copy-and-process changes, all free, all honest, none touch prices. Do these before anything else.

**4.1.1 Sharpen the guarantee and put it next to every buy button.**

The existing promise is good. Make it concrete and put it where the decision happens. Recommended wording (keep the warm voice, add specifics):

> **Risk reversal.** Not happy with your purchase within your first 30 days? Email kevinyosef54@gmail.com and I'll refund you in full. No forms, no "did you try harder?" interrogation, no guilt. I'd rather you have a working system than keep your money.

For Done-For-You and Premium, add a *delivery* commitment on top — it's a service, so guarantee the service, not just the refund:

> **Setup guarantee.** If we don't leave your setup call with a tested, working bot that replies to you on Telegram, your money back — and I keep working until it's live. Same 30-day refund applies after that.

Rules: the guarantee line goes directly under each "Get X →" button (one line, not hidden in italics), and the full version repeats at the bottom of the section. "No questions asked" stays — it's the honest truth of how the seller runs refunds and it's the strongest line in the offer.

**4.1.2 Turn the three free workflows into a proof ladder.**

The free workflows are the single most honest proof this offer has: the buyer can install the actual product, feel it check in on them, and *then* decide to pay. Make that the pitch, not a side note:

> **Try it before you pay anything.** Install the three free workflows and run them for a week. Feel what it's like to have something check in on you at 7am instead of waiting for you to remember. If you want it done for you after that, the setup services are right here. If not, you've lost nothing but an afternoon — that's the point.

This also solves the "what's the risk?" question for the $60 tier: the risk is already near zero because the free version proves the product works.

**4.1.3 Answer the sample-of-one objection head-on.**

Every neurodivergent buyer will wonder whether it works for *them*. Say it plainly, in the founder's voice:

> **Is this just for Kevin?** Fair question — I'm one person, not a company, and I'm my own main beta tester. Here's what that means for you: every workflow is plain text, and you can read every word before you pay. Nothing is a black box. The check-ins are deliberately adjustable — mood, energy, sleep, task-load all get tuned to *your* patterns on the call, not to mine. And if it doesn't fit you, the refund is unconditional. The worst case is you're out 30 minutes of reading.

**4.1.4 Name the method.**

The three free workflows (Morning Anchor, Daily Check-in, Evening Wind-Down) already use "anchor" language. Name the system so it's repeatable: **"The Anchor Method — three daily check-ins that hold your day in place."** Use it as the subtitle of the free section and the referral hook ("I signed up for the Anchor Method"). One line, no new products, compounds every downstream mention.

### 4.2 The second lever to fix: **effort & sacrifice**

The Done-For-You tier currently costs the buyer 2–4 hours of their own time. For this audience that's not a footnote — it's most of the reason people hesitate. Two changes:

**4.2.1 Shrink the buyer's time with an async intake.**

Replace the account-creation Q&A *inside* the 45-min call with a short intake form sent right after purchase (what apps/accounts they have, their routine, their patterns, what "stuck" looks like for them). The call then starts at personalization instead of Q&A. Update the caveat to say:

> **Your time.** Total, end to end: about 30 minutes filling out a short intake form, plus the call itself. The bot is live and tested before we hang up.

This must stay honest — the seller still needs account access and their answers — but the *framing* changes from "you're paying for time savings" (which still requires 2–4 hours of your time) to a concrete, small number. If the seller finds buyers still need ~2 hours in practice, the claim must be "you're done in one session," not a smaller number. Honesty first.

**4.2.2 Remove decisions, don't add them.**

The intake form doubles as the decision-maker: the seller proposes the workflows and personalization from the buyer's answers, so the buyer never faces "which 5 workflows do I want?" Every decision a neurodivergent buyer has to make is friction. Default everything; let them override.

### 4.3 Bonus stack (no new Polar links required)

Add 3–4 bonuses per tier, each closing a real objection. All are deliverables the seller can create from what already exists in the repo. **Do not** attach inflated dollar values ("worth $500!") — these are unverifiable, and bonus-stacking rules say only quote values you can compare to a real sale. The one exception: the premium workflows, which literally sell for $10 each, so "$30 value" is defensible.

**For all tiers (day-1 bonuses, delivered by email/Telegram after purchase):**
1. **The Week-One Checklist** — the exact first 7 days: what to reply to each check-in, when to customize, what *not* to do yet. Closes *"I'll lose momentum in week 2."*
2. **The Relapse Reset** — plain-language instructions for after a rough week: what to say to the agent ("I'm in a dip, lighten the load"), how to drop tasks without guilt, and the recovery cadence. Written from lived experience. Closes *"what happens when I fall off?"*
3. **The Sleep Protocol** — a one-page checklist that pairs with Evening Wind-Down: the wind-down triggers, what the agent will and won't do about sleep, how to reset after a bad night. Sleep is already the offer's #1 lever; make it explicit.

**For Starter, one more:** a **task-initiation micro-script** — a 10-line prompt that breaks a frozen task into 5 under-5-minute steps. ⚠️ This overlaps with the $10 Task Unstucker, so before shipping it the seller must decide: fold the micro-script in as a Starter bonus (defensible — it's the "lite" version, and premium buyers are buying the tuned, installed version), or keep it out to protect the $10 sale. If the seller instead wants to *sell* it, that's **[NEEDS NEW POLAR LINK + SELLER DECISION]**.

**For Done-For-You:** the three premium workflows are already included — state that in the tier list as an explicit value line ("3 premium workflows included — $30 value if bought separately"), plus a **day-30 recovery check-in** (a follow-up touch at day 30, extending the current 2-week window to the point where most people actually quit). The day-30 check-in is seller time, not a new product — no link needed.

**For Premium:** do not add more — the tier is already rich (monthly calls, reports, tuning, integrations). Stacking more on Premium cheapens the differentiation and bloats the audit. Keep Premium focused; if anything, the pattern report becomes the anchor artifact that justifies renewal-style value (see §5.3).

### 4.4 Honest scarcity / urgency

The real constraint is the seller's own calendar: setup calls are live and it's just one person. That's a genuine capacity cap. Recommended copy, next to the Done-For-You and Premium buttons:

> **Booking honestly:** the setup calls are live and it's just me, so I take a limited number each week. If the calendar's full, you pick the next open slot — nothing expires, no countdown. I'd rather book you when I can actually show up than sell you a slot I can't fill.

No fake countdowns, no "only 3 spots left." If the seller ever wants to do a founding-price or launch-window mechanic, that's a price/product change → **[NEEDS NEW POLAR LINK + SELLER DECISION]**.

### 4.5 Naming & clarity tweaks

- Add **"The Anchor Method"** as the name for the three daily check-ins (§4.1.4).
- Tier names are fine. The Done-For-You tagline could be outcome-tightened: from "Most popular — just works" to "Most popular — you get a working bot in one call." One line, keeps the positioning.
- ~~Resolve the **"5 workflow templates"** ambiguity on Starter~~ **DECIDED:** the five are Morning Anchor, Daily Check-in, Evening Wind-Down (free) + Burnout Early Warning + Task Unstucker (premium). Job Hunt Assistant is deliberately excluded so it stays the Done-For-You/Premium differentiator. Named in README.md and OFFER §1.
- ~~Fix the **premium-inclusion inconsistency**~~ **DECIDED:** Burnout Early Warning + Task Unstucker are included in **every** paid tier (Starter, Done-For-You, Premium); Job Hunt Assistant is included in Done-For-You and Premium only. README.md, WORKFLOWS.md, and the three `workflows/*.md` files now agree. Implication for the $10 individual sale: it still stands — the add-on is for buyers who don't want a full setup tier, or want Job Hunt on its own.

---

## 5. Pricing sanity check (pricing skill lens)

**Anchoring — sound.** $60 → $199 → $599 is a clean good-better-best ladder. Premium at ~3x Done-For-You fits the 2–3x guideline for the Best tier; Starter is a low-friction entry. The anchor pair ($60 against the free DIY path, $599 against the middle) does its job. Keep it.

**Middle tier — correctly positioned.** Done-For-You is marked "Most popular — just works," which is exactly where the recommended tier should sit. $199 for a tested, working install plus follow-up is the natural reference point. Do not move the "Most popular" label.

**$599 for 3 months of active service** (monthly calls, reports, tuning, integrations, crisis setup) is defensible and stays honest as "one-time." Two watch-outs: (a) don't let it drift into "basically a subscription" without saying so; (b) the value should be visible as *time and attention* — the monthly pattern report is the artifact that makes the ongoing service tangible. If Premium buyers never see the report, the tier feels like it ends at the call.

**$10 premium workflows — fine, but watch the narrative.** At $10 they're an impulse add-on, which is good for the seller's entry funnel. But "$10 each" quietly undercuts the premium positioning of "these are the real system." Since Done-For-You/Premium bundle them anyway, the $10 line mainly serves as a foot-in-the-door. Acceptable — just don't sell them as "premium" *and* "ten bucks" in the same breath; frame the $10 price as the taste, the tuned/installed version as the real thing.

**The $60 Starter competes with free.** The repo is MIT and the DIY path is free and ~2 hours. That's not a bug — the Starter's real job is "pay $60 to skip the setup and get a human." The tier description should say that out loud ("skip the 2-hour setup") instead of listing "full repo access" (which is free anyway).

**Payment flexibility — the only real pricing gap.** $199 and $599 are pay-in-full only. A 2-installment option would likely lift conversion for a budget-conscious audience. But it's a Polar product/price change → **[NEEDS NEW POLAR LINK + SELLER DECISION]** (see §7).

---

## 6. Recommended sequence

1. **Guarantee** — sharpen the wording, add the setup-delivery line for DFY/Premium, place under every buy button (copy only). *Biggest perceived-likelihood lift for zero cost.*
2. **Proof ladder + sample-of-one answer** — add the "try it free before you pay" framing and the "Is this just for Kevin?" paragraph (copy only).
3. **Bonus stack** — add the three day-1 asset bonuses (Week-One Checklist, Relapse Reset, Sleep Protocol) to the tier lists; add the "3 premium workflows included" line to Done-For-You (deliverables only, no new links). Decide the micro-script question before Starter ships.
4. **Effort reduction** — async intake form; retime the "your time" caveat; default decisions from the intake answers (process change, no pricing impact).
5. **Capacity scarcity** — add the honest "booking" line under DFY/Premium buttons (copy only).
6. ~~**Consistency cleanups**~~ **DONE** — premium-inclusion mismatch and "5 workflow templates" ambiguity resolved (see §4.5): Burnout + Task Unstucker ship with all three tiers; Job Hunt ships with Done-For-You + Premium; Starter's five templates are named.
7. **Later, optional, only if desired** — payment plans, a discounted workflow bundle, founding pricing. Each is a real product change → **[NEEDS NEW POLAR LINK + SELLER DECISION]**.

---

## 7. [NEEDS NEW POLAR LINK + SELLER DECISION] register

Anything here changes what's sold or what it costs — the seller decides, and Polar needs a new product/price/checkout link (per POLAR_PRODUCTS.md: never resurrect archived prices; create fresh).

- **2-installment payment plan** for Done-For-You ($199) and/or Premium ($599).
- **A discounted "all three premium workflows" bundle** (e.g., 3 × $10 → less).
- **Selling any new bonus asset as a standalone product** (e.g., the task-initiation micro-script, the Relapse Reset).
- **Founding-price or price-increase mechanics** (e.g., "$599 for the first N buyers, then $X").

Everything else in this audit — guarantee copy, proof framing, bonus assets, capacity scarcity, naming, intake process — ships with no new checkout links and no price changes.
