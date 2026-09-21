# Errors: fetch-orbit.sh Failure Modes

Source: `fetch-orbit.sh`.

## Key points
- `set -euo pipefail` — any failed step aborts script.
- Secret leak: `grep -qE 'sk-or-'` match prints `SECRET LEAK — aborting` and exits 1.
- Syntax check fails → abort before commit (`bash -n` wrapper, `ast.parse` real).
- Laptop unreachable → `hx` call fails, script exits (run via wake-watcher cronjob).
- Empty/malformed dump → `sed` split yields bad files, caught by syntax check.

## Minimal example
```
grep -qE 'sk-or-' orbit orbit.wrapper.sh && { echo "SECRET LEAK — aborting"; exit 1; } || true
```

## Notes
- Commit only runs after all guards pass.