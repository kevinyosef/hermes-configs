# Polar.sh Products — Hermes Setup Services (2026-08-11)

Organization: `16fc1291-fa43-42cc-83f8-a2d26926a6cb`

All legacy products (Config Setup, Desktop Integration, Server, Messaging, Bitwarden, Pro Bundle, Donate — from the July config-biz pilot) were **archived** on 2026-08-11. Nothing reused; fresh set below.

## Active Products

| Tier | Price | Product ID | Price ID | Buy Link |
|------|-------|-----------|----------|----------|
| 💼 Starter Pack | $60 one-time | `0b31afe3-7f38-4482-bf10-9aa735ef2c91` | `b4f99af7-e1d8-4300-832a-14547423943c` | https://buy.polar.sh/b4f99af7-e1d8-4300-832a-14547423943c |
| ⚡ Done-For-You | $199 one-time | `76798192-f86f-4723-99b1-30bb1b16b46a` | `85c2b008-73e8-40d6-8e37-45751803e500` | https://buy.polar.sh/85c2b008-73e8-40d6-8e37-45751803e500 |
| 🎯 Premium | $400 one-time | `d18b8cb1-6839-4229-a559-882766edb40e` | `6463fcaf-3fce-447e-884f-fafaa8bb44a2` | https://buy.polar.sh/6463fcaf-3fce-447e-884f-fafaa8bb44a2 |

## API Notes (Cloudflare)

- Base: `https://api.polar.sh/v1` (products list/create at `/products`, update at `/products/{id}`, archive via `PATCH {"is_archived": true}` — DELETE returns 405, archive is the supported path).
- **Cloudflare WAF requires a browser-like `User-Agent` + `Accept` header** — bare urllib gets 403 error 1010; curl with default UA works.
- Redirects: API issues 307 on some endpoints; follow `Location` (curl `-L`).
- Amounts are in **cents** (`price_amount`), `amount_type: "fixed"` (not `"type"`).