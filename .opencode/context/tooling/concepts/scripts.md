# Concept: Wrapper vs Fetch Script

Source: `orbit.wrapper.sh`, `fetch-orbit.sh`.

Two shell scripts surround the `orbit` binary. Wrapper runs it; fetch script imports it from a remote laptop.

## Key points
- `orbit.wrapper.sh` — fish script, 2 lines. Runs `python3 ~/.local/bin/orbit.real $argv`.
- `orbit` — the real Python binary, pulled from remote. Do not read directly.
- `fetch-orbit.sh` — bash, pulls `orbit` + wrapper from `omers-backup-laptop` via `hx`.
- Fetch splits remote dump on `===WRAPPER===` / `===REAL===` markers.
- Fetch runs syntax checks + secret-leak guard before commit.

## Minimal example
```
# wrapper (fish)
python3 ~/.local/bin/orbit.real $argv
```

## Notes
- Wrapper exists so `orbit` on PATH is fish-compatible; real logic lives in `orbit.real`.