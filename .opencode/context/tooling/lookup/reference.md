# Lookup: Commands, Paths, Env, Flags

Source: `README.md`, `orbit.wrapper.sh`, `fetch-orbit.sh`.

## Commands
| Command | Purpose |
|---------|---------|
| `orbit` | Account credits + per-key usage |
| `orbit --days N [--key NAME]` | Per-model/per-day activity, last 30 UTC days |
| `orbit --set-key` | Rotate stored management key |

## Paths
| Path | Role |
|------|------|
| `~/.local/bin/orbit` | Installed wrapper (fish) |
| `~/.local/bin/orbit.real` | Real Python binary |
| `~/.config/openrouter-monitor/key` | Management key, 0600 |
| `~/bin/hx` | Remote exec helper used by fetch |

## Env / vars
| Var | Role |
|-----|------|
| `$argv` | Args passed wrapper → `orbit.real` |
| `hx` | Set to `~/bin/hx` in fetch script |

## API endpoints
| Endpoint | Key type |
|----------|----------|
| `/api/v1/auth/key` | any `sk-or-v1-` |
| `/api/v1/credits` | `sk-or-mgmt-…` |
| `/api/v1/keys` | `sk-or-mgmt-…` (bare list) |
| `/api/v1/activity` | `sk-or-mgmt-…` (30 UTC days) |