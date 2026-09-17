# macacfs — mini ACFS for Mac

A tiny macOS companion to [ACFS](https://github.com/Dicklesworthstone/agentic_coding_flywheel_setup). ACFS itself only supports Ubuntu/Arch and assumes a fresh VPS (apt, systemd, a provisioned `ubuntu` user). `macacfs` does **not** try to port all of that. It does three small things:

1. **Installs the Dicklesworthstone ACFS-suite tools on your Mac.**
2. **Sets up the same terminal environment ACFS gives you** — Oh My Zsh, Powerlevel10k, zsh plugins, a Nerd Font, a modern-CLI bundle, atuin/zoxide/lazygit/ast-grep.
3. **Installs a `launchd` agent that updates everything weekly** (with failure-driven retries).
4. **Updates the tools — and itself — from a simple `macacfs` CLI.**

That's the whole scope. No user provisioning, no OS upgrades, no service orchestration.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/CastIronPlatypus/macacfs/main/install.sh | bash
```

This clones macacfs to `~/.macacfs` and links `macacfs` into `~/.local/bin`. Make sure `~/.local/bin` is on your `PATH`.

## Usage

```bash
macacfs install            # install all 39 tools (or: macacfs install BR NTM)
macacfs shell              # set up the terminal environment (omz, p10k, CLI bundle, ...)
macacfs update             # update all tools + refresh the shell bundle
macacfs update BR NTM      # update just the named tools (no shell refresh)
macacfs install --dry-run  # show what would happen, change nothing
macacfs shell --dry-run    # same, for the terminal setup
macacfs self-update        # update macacfs itself from its repo
macacfs schedule           # install the weekly auto-update LaunchAgent
macacfs schedule --status  # show cadence, last run, and failure count
macacfs schedule --uninstall
macacfs list               # show the tool catalog
```

Tools are named by abbreviation (`BR`) or cli (`br`), case-insensitive.

## Terminal environment (`macacfs shell`)

`macacfs shell` reproduces the terminal setup ACFS installs, adapted for macOS + Homebrew:

- **Shell UX:** Oh My Zsh, **Powerlevel10k** (with a pre-baked `~/.p10k.zsh` so there's no wizard), and the `zsh-autosuggestions` / `zsh-syntax-highlighting` plugins.
- **Managed zshrc:** a mac-adapted `~/.zshrc` (Homebrew shellenv, PATH, modern-CLI aliases, zoxide/atuin init). Your existing `~/.zshrc` is **backed up** to `~/.zshrc.bak.<timestamp>` first; the managed body lives in `~/.macacfs.zshrc`.
- **tmux config:** ACFS's `~/.tmux.conf` (Ctrl-a prefix, mouse, 50k scrollback, vim-style panes/copy, base-index 1, top status bar, `detach-on-destroy off` + `monitor-activity on` for NTM/agent workflows, sources `~/.tmux.conf.local`). Any existing `~/.tmux.conf` is **backed up** first.
- **Nerd Font:** `font-meslo-lg-nerd-font` so the p10k icons render.
- **Modern-CLI bundle (`share/shell-bundle.tsv`):** ripgrep, fd, bat, eza, lsd, dust, btop, neovim, tmux, fzf, direnv, jq, gh, git-lfs, rsync.
- **Standalone tools:** **atuin** (searchable shell history) behind an **agent-safe shim**, plus **zoxide**, **lazygit**, and **ast-grep**.

**The atuin shim** is installed at `~/.local/bin/atuin` (ahead of Homebrew's atuin on `PATH`). It detects coding-agent sessions — via env markers (`CLAUDE_PROJECT_DIR`, `CODEX_THREAD_ID`, …) or the parent process name — and no-ops history recording and the atuin hook there, so agent-run commands never flood your history or trigger `EPIPE`. Interactive use passes straight through to the real atuin.

Re-running `macacfs shell` is idempotent (it upgrades brew packages and fast-forwards the git-cloned pieces). A full `macacfs update` refreshes the Homebrew part of this bundle too, so the weekly LaunchAgent keeps your CLI tools current without ever rewriting your shell config.

## How it installs each tool

Each tool is installed by the method recorded in `share/manifest.tsv`. macacfs
**prefers Homebrew** wherever `dicklesworthstone/tap` publishes a formula; the
rest use each tool's own installer, `cargo install --git`, or `go install`:

| method | how | tools |
|---|---|---|
| `brew` | `brew install/upgrade dicklesworthstone/tap/<formula>` | BR, BV, CAAM, CASS, CM, DCG, EE, MAIL, NTM, RCH, RU, SLB, TRU, UBS, XF |
| `installer-sh` | the tool's own `install.sh` (installs latest) | WA, BRENNER, SRPS, APR, PT, GIIL, CSCTF, RANO, MDWB, S2P, AADC, FSFS, SBH, CASR, DSR, ASB, PCR, FMD, PI, PFR |
| `cargo-git` | `cargo install --git … --force` | MS, RP, CAUT, JFP |

**Install and update are the same operation** — every method installs the latest, so re-running upgrades in place.

## Prerequisites

`macacfs` installs missing toolchains for you (best-effort): Homebrew first, then
Rust, Go, uv, and Node as needed. Anything it can't provide is warned about, and
any tool that truly needs a missing toolchain fails loudly rather than silently.

> **First-time macOS note:** Homebrew and any compiled tool need the Xcode
> Command Line Tools license accepted once: `sudo xcodebuild -license accept`
> (or `xcode-select --install`). Until then, brew-based installs will fail loudly.

## Weekly updates & failure escalation

`macacfs schedule` installs a `launchd` LaunchAgent (`com.macacfs.update`) that runs `macacfs update`:

- **Weekly** (Sunday 03:00) normally.
- If a run **fails**, it retries **nightly** (03:00) until it succeeds.
- After **3 consecutive failures**, it switches to **daily at 14:00** until it succeeds, then returns to weekly.

Run state (last run time, status, consecutive failures, current cadence) lives in
`~/.local/state/macacfs/state.env`; logs are under `~/.local/state/macacfs/logs/`.

## Design notes

- **macOS only.** Refuses to run elsewhere.
- **Fail loud.** No silent fallbacks; every per-tool failure is shown with its error and the command exits non-zero if any tool failed.
- **Never starts services.** macacfs installs and updates binaries only — it never launches a tool's server/daemon (e.g. the agent-mail server).

## Layout

```
bin/macacfs                 CLI entrypoint + dispatch
lib/catalog.sh              manifest loader
lib/methods.sh              per-method install/update functions
lib/shell.sh               terminal-environment setup (omz/p10k/CLI bundle/atuin...)
lib/prereq.sh               toolchain auto-installer
lib/report.sh              isolated runner + ✅/❌ summary
lib/schedule.sh            launchd state + cadence + plist writer
lib/selfupdate.sh          self-update from the repo
share/manifest.tsv         the 39-tool catalog (source of truth)
share/shell-bundle.tsv     the modern-CLI Homebrew bundle
share/zshrc.mac.zsh        the mac-adapted managed zshrc
share/p10k.zsh             the Powerlevel10k preset
share/tmux.conf            the tmux config (installed to ~/.tmux.conf)
share/atuin-guard.sh       the atuin agent-safe shim
share/macacfs.plist.template  LaunchAgent template
install.sh                  one-liner bootstrap
```
