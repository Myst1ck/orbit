# Guide: Install & Update

Source: `README.md`, `fetch-orbit.sh`.

## Install
```
install -m 755 orbit ~/.local/bin/orbit
mkdir -p ~/.config/openrouter-monitor && chmod 700 ~/.config/openrouter-monitor
# put your sk-or-mgmt-… key in ~/.config/openrouter-monitor/key (0600)
```

## Run
```
orbit
orbit --days N [--key NAME]
orbit --set-key
```

## Update (fetch from laptop)
Run `fetch-orbit.sh` when `omers-backup-laptop` reachable, or via wake-watcher cronjob.

Steps script performs:
1. `cd` to script dir.
2. `hx omers-backup-laptop -c '...'` dumps wrapper + real to temp file.
3. Split dump into `orbit.wrapper.sh` and `orbit`.
4. `chmod 755 orbit`.
5. Syntax check: `bash -n` wrapper, `ast.parse` real.
6. Secret-leak guard: abort if `sk-or-` found.
7. `git add -A && git commit`.

## Notes
- Management key created at openrouter.ai/settings/management-keys.
- Key file mode 0600; never typed by an agent.