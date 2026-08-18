# AGENTS.md

## What this repo is
Not application code — marketing docs + workflow prompts + a one-click deploy script for a paid product (a Hermes Agent Telegram check-in bot for ADHD/Bipolar). There is no build, test, or lint step; "verifying" changes means cross-checking the docs against each other (prices, filenames, checkout links).

## Layout
- `README.md` — landing/marketing page (pricing tables, polar.sh buy CTAs, setup service tiers)
- `INSTALL.md` / `SETUP.md` / `WORKFLOWS.md` / `USER-GUIDE.md` — install walkthrough, 15-min setup, workflow reference, buyer's manual
- `workflows/` — 6 markdown files (see free vs premium below)
- `config/config.example.yaml` — reference ONLY; the live `config/config.yaml` is gitignored (contains secrets). Comment header says don't edit manually.
- `deploy/bootstrap.sh` — VPS one-click deploy via cloud-config/user-data (Hetzner, DO, Vultr, etc.); `deploy/README.md` explains the seller workflow
- `POLAR_PRODUCTS.md` — internal billing reference: real checkout-link tokens (`polar_cl_...`) + buy URLs + Polar API notes

## Workflows: free vs premium — don't confuse the two
- **Free** (`morning-anchor.md`, `daily-checkin.md`, `evening-winddown.md`): contain the full `## System Prompt` fenced block. Install path is pasting that block to the bot in Telegram (SETUP.md Part 3) — no file copying. Editing these edits the actual prompt.
- **Premium** (`burnout-detection.md`, `task-unstucker.md`, `job-hunt.md`): intentionally contain NO prompt — just marketing descriptions + buy links (the full prompts are paywalled and delivered after purchase). Keep them that way.

## Gotchas
- **Pricing consistency:** README.md, WORKFLOWS.md, POLAR_PRODUCTS.md must agree: Starter $60 / Done-For-You $199 / Premium $599; premium workflows $10 each. The three premium `workflows/*.md` files still show stale prices ($45 / $150–250) — don't propagate those numbers anywhere.
- **Checkout links:** the `https://buy.polar.sh/polar_cl_...` URLs in README.md/WORKFLOWS.md must match the `polar_cl_...` tokens in POLAR_PRODUCTS.md. Do NOT verify a link by fetching it — buy.polar.sh returns HTTP 200 for any path (per POLAR_PRODUCTS.md); match tokens instead.
- **Secrets:** never write real credentials. `config/config.yaml` and `data/` are gitignored. `deploy/bootstrap.sh` has placeholder CONFIG values (`***`) that the seller fills per buyer — keep them placeholders in the repo.
- **Defaults in the docs:** timezone `Africa/Nairobi`; models `deepseek-v4-flash-free` (free) / `deepseek-v4-pro`. Stale mentions of other model names should be corrected to these.
