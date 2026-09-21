# ORbit

**OpenRouter usage monitor — a small CLI called `orbit`.**

Started as a quick "how much have I spent" script and grew into a proper tool:
per-key credit tracking, activity windows, colored bars, compact table style.

## What it does
- `orbit` — account-wide credits + per-key usage with caps, bars and totals
- `orbit days N [--key NAME]` — per-model/per-day activity for the last 30 UTC days
- `orbit --set-key` — rotate the stored management key (0600, never typed by an agent)

## Install
```
install -m 755 orbit ~/.local/bin/orbit
mkdir -p ~/.config/openrouter-monitor && chmod 700 ~/.config/openrouter-monitor
# put your sk-or-mgmt-… key in ~/.config/openrouter-monitor/key (0600)
```

## Notes
- Per-key endpoints (`/api/v1/auth/key`) accept any normal `sk-or-v1-` key.
- Account-wide + admin endpoints (`/api/v1/credits`, `/api/v1/keys`,
  `/api/v1/activity`) require a **management key** (`sk-or-mgmt-…`), created at
  openrouter.ai/settings/management-keys.
- `/api/v1/keys` returns a bare list, not `{data: [...]}`. `/api/v1/activity`
  covers only the last 30 completed UTC days, one date per request.
