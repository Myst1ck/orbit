#!/usr/bin/env bash
# fetch-ormon.sh — pull ormon from omers-backup-laptop into this repo.
# Run when the laptop is reachable (or via the wake-watcher cronjob).
set -euo pipefail
cd "$(dirname "$0")"
hx=~/bin/hx
tmp=$(mktemp -d)
$hx omers-backup-laptop -c 'echo "===WRAPPER==="; cat ~/.local/bin/ormon; echo "===REAL==="; cat ~/.local/bin/ormon.real' > "$tmp/dump.txt"
# split the dump
sed -n '/^===WRAPPER===$/,/^===REAL===$/p' "$tmp/dump.txt" | sed '1d;$d' > ormon.wrapper.sh
sed -n '/^===REAL===$/,$p'     "$tmp/dump.txt" | sed '1d'    > ormon
chmod 755 ormon
# sanity: syntax check before committing
bash -n ormon.wrapper.sh && python3 -c "import ast; ast.parse(open('ormon').read())"
grep -qE 'sk-or-' ormon ormon.wrapper.sh && { echo "SECRET LEAK — aborting"; exit 1; } || true
git add -A && git commit -m "Import ormon from omers-backup-laptop (wrapper + real)" && git log --oneline
