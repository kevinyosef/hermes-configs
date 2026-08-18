# Polar.sh Products — Hermes Setup Services (2026-08-11)

Organization: `16fc1291-fa43-42cc-83f8-a2d26926a6cb`

All legacy products (Config Setup, Desktop Integration, Server, Messaging, Bitwarden, Pro Bundle, Donate — from the July config-biz pilot) were **archived** on 2026-08-11. Nothing reused; fresh set below.

## Active Products

Checkout links created 2026-08-11 via `POST /v1/checkout-links/` (Stripe). The `polar_cl_...` token is the checkout link's `client_secret`; the buy URL is `https://buy.polar.sh/<client_secret>`.

| Tier | Price | Product ID | Price ID | Checkout Link ID (`polar_cl_`) | Buy Link |
|------|-------|-----------|----------|----------|----------|
| 💼 Starter Pack | $60 one-time | `0b31afe3-7f38-4482-bf10-9aa735ef2c91` | `b4f99af7-e1d8-4300-832a-14547423943c` | `polar_cl_o4Tuaepm65AqQgHWUKW7K9vmlO9mvxANJXpvV2MRLva` | https://buy.polar.sh/polar_cl_o4Tuaepm65AqQgHWUKW7K9vmlO9mvxANJXpvV2MRLva |
| ⚡ Done-For-You | $199 one-time | `76798192-f86f-4723-99b1-30bb1b16b46a` | `85c2b008-73e8-40d6-8e37-45751803e500` | `polar_cl_S54SOTeMABojUgsNYT1hPMViHnczfM2Bkr7IK2HDTtn` | https://buy.polar.sh/polar_cl_S54SOTeMABojUgsNYT1hPMViHnczfM2Bkr7IK2HDTtn |
| 🎯 Premium | $599 one-time (was $400 — old price `6463fcaf...` archived) | `d18b8cb1-6839-4229-a559-882766edb40e` | `2571ffbe-50bc-47d7-9d29-b87e40e69476` | `polar_cl_9qFE7mpFbSAMoTcb5l0fl9QOMsfpfylfyQPzv1UpTQn` | https://buy.polar.sh/polar_cl_9qFE7mpFbSAMoTcb5l0fl9QOMsfpfylfyQPzv1UpTQn |
| ⚠️ Burnout Early Warning | $10 one-time | `5bf804be-73d4-4bc5-ac7b-b4a728e25a7a` | `f96a68ad-a3d6-4e87-903c-3bfc9d0ea0b3` | `polar_cl_fQsiOfSsuBuUFl46ohBMzv6W30FboezCekbg108suvm` | https://buy.polar.sh/polar_cl_fQsiOfSsuBuUFl46ohBMzv6W30FboezCekbg108suvm |
| 🧩 Task Unstucker | $10 one-time | `ceef45d1-81a3-4266-95d0-801be9e2c34d` | `b3cb90a6-5f10-43bf-82a6-38af12068b9b` | `polar_cl_WbZiB9ySNdj8WzbyPT2dghyZKv7X161q1M1JT2RD46n` | https://buy.polar.sh/polar_cl_WbZiB9ySNdj8WzbyPT2dghyZKv7X161q1M1JT2RD46n |
| 💼 Job Hunt Assistant | $10 one-time | `d129270c-9147-47f0-9325-cce1b38a8cf8` | `c997fde9-9919-4857-b537-ec024366b9cd` | `polar_cl_vybMXFn5O9MM01f14c2SrVxNCwYthAonnPaKL3ho255` | https://buy.polar.sh/polar_cl_vybMXFn5O9MM01f14c2SrVxNCwYthAonnPaKL3ho255 |

## API Notes (Cloudflare)

- Base: `https://api.polar.sh/v1` (products list/create at `/products`, update at `/products/{id}`, archive via `PATCH {"is_archived": true}` — DELETE returns 405, archive is the supported path).
- **Checkout links (REAL buy links):** `POST /v1/checkout-links/` with body `{"payment_processor": "stripe", "product_price_id": "<price_id>", "label": "<optional>"}` (schema `CheckoutLinkCreateProductPrice`). Response: `id` (UUID), `client_secret` (`polar_cl_...`), `url` = `https://buy.polar.sh/<client_secret>`. Verify with `GET /v1/checkout-links/{id}`.
- **⚠️ `https://buy.polar.sh/<price_id>` is NOT a valid checkout link** — buy.polar.sh returns HTTP 200 for *any* path (it serves the Polar marketing homepage). A plain URL check proves nothing. Verify checkout links by **content**: fetch the URL and confirm it redirects to `polar.sh/checkout/polar_c_...` and the page contains the product name + checkout markup (not marketing copy like "A financial substrate for modern software").
- **Archived prices reject checkout-link creation** with HTTP 422 `"Price is archived."` — only active prices work. There are no price-level API endpoints; prices are managed via `PATCH /products/{id}`. When the offer changes, archive the old price/product and create a fresh one (never resurrect archived prices).
- **Cloudflare WAF requires a browser-like `User-Agent` + `Accept` header** — bare urllib gets 403 error 1010; curl with default UA works.
- Redirects: API issues 307 on some endpoints; follow `Location` (curl `-L`).
- Amounts are in **cents** (`price_amount`), `amount_type: "fixed"` (not `"type"`).
