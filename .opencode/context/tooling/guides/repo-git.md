# Guide: Git Remotes & PR Workflow

Source: PR #2 flow.

## Remotes
| Remote | URL | Role |
|--------|-----|------|
| `origin` | `/home/omera/repos/orbit.git` | Local bare repo, plain push target |
| `github` | `https://github.com/Myst1ck/orbit.git` | Push here before opening PR |

## PRs
- Push branch to `github` first.
- `gh pr create --repo Myst1ck/orbit --base main`
- `--repo` required: `gh` defaults to `origin` (local bare repo), which fails.