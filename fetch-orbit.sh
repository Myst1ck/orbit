#!/usr/bin/env bash
# fetch-orbit.sh — pull orbit from omers-backup-laptop into this repo.
# Run when the laptop is reachable (or via the wake-watcher cronjob).
set -euo pipefail
cd "$(dirname "$0")"
hx=~/bin/hx
tmp=$(mktemp -d)
$hx omers-backup-laptop -c 'echo "===WRAPPER==="; cat ~/.local/bin/orbit; echo "===REAL==="; cat ~/.local/bin/orbit.real' > "$tmp/dump.txt"
# split the dump
sed -n '/^===WRAPPER===$/,/^===REAL===$/p' "$tmp/dump.txt" | sed '1d;$d' > orbit.wrapper.sh
sed -n '/^===REAL===$/,$p'     "$tmp/dump.txt" | sed '1d' | sed '/^=== exit:/q' | sed '$d' > orbit
chmod 755 orbit
# sanity: syntax check before committing
bash -n orbit.wrapper.sh && python3 -c "import ast; ast.parse(open('orbit').read())"
grep -qE 'sk-or-' orbit orbit.wrapper.sh && { echo "SECRET LEAK — aborting"; exit 1; } || true
git add -A && git commit -m "Import orbit from omers-backup-laptop (wrapper + real)" && git log --oneline
