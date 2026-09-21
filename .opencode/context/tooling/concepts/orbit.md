# Concept: `orbit`

Source: `README.md`, `orbit.wrapper.sh`.

`orbit` is a Python CLI that monitors OpenRouter usage — account-wide credits plus per-key usage with caps, bars, and totals. Repo `ORbit` is its home.

## Key points
- Account-wide credits + per-key usage, caps, colored bars, totals.
- `--days N [--key NAME]` shows per-model/per-day activity for last 30 UTC days.
- `--set-key` rotates stored management key (0600, never typed by agent).
- Per-key endpoints accept any normal `sk-or-v1-` key.
- Account-wide/admin endpoints need management key `sk-or-mgmt-…`.

## Minimal example
```
orbit
orbit --days 7 --key mykey
orbit --set-key
```

## Notes
- `/api/v1/keys` returns bare list, not `{data: [...]}`.
- `/api/v1/activity` covers only last 30 completed UTC days, one date per request.