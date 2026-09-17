#!/usr/bin/env bash
# lib/shell.sh — set up the macOS terminal environment (ACFS parity).
# Realizes: shell-setup-functions / shell-fns-code / fb-lib-shell.
#
# One function per provisioning action, each idempotent and dry-run-aware. Nothing
# here starts a daemon (rule r-no-servers): 'atuin daemon' is never launched — we
# only install the binary and a passthrough shim. Re-running any function upgrades
# in place, so install == update.
#
# shell_run <install|refresh> is the entrypoint:
#   install  — full setup (brew bundle, font, omz, plugins, p10k, managed zshrc,
#              zoxide, lazygit, ast-grep, atuin+shim)
#   refresh  — brew-only upgrades (bundle, font, zoxide, lazygit, ast-grep, atuin),
#              used by 'macacfs update' so a weekly run keeps the CLI tools current
#              without rewriting your shell config.

_sh_dry() { [ "${DRY_RUN:-0}" = 1 ]; }

_sh_brew_prefix() { brew --prefix 2>/dev/null || echo /opt/homebrew; }

# _brew_pkg <formula|cask> <name> — install if missing, upgrade if present.
_brew_pkg() {
  local kind="$1" name="$2" flag=""
  [ "$kind" = cask ] && flag="--cask"
  if _sh_dry; then
    printf '    [dry-run] brew install %s%s\n' "${flag:+$flag }" "$name"
    return 0
  fi
  # shellcheck disable=SC2086
  if brew list $flag --versions "$name" >/dev/null 2>&1; then
    # 'already up to date' exits non-zero on some brews; that is not a failure.
    # shellcheck disable=SC2086
    brew upgrade $flag "$name" 2>&1 || true
    # shellcheck disable=SC2086
    brew list $flag --versions "$name" >/dev/null 2>&1
  else
    # shellcheck disable=SC2086
    brew install $flag "$name"
  fi
}

# _sh_git_get <url> <dir> [clone-flags...] — clone if absent, else ff-pull.
_sh_git_get() {
  local url="$1" dir="$2"; shift 2
  if [ -d "$dir/.git" ]; then
    if _sh_dry; then printf '    [dry-run] git -C %s pull --ff-only\n' "$dir"; return 0; fi
    git -C "$dir" pull --ff-only 2>&1 || true
    return 0
  fi
  if _sh_dry; then printf '    [dry-run] git clone %s -> %s\n' "$url" "$dir"; return 0; fi
  git clone "$@" "$url" "$dir"
}

# --- provisioning actions ---------------------------------------------------

# The modern-CLI Homebrew bundle (share/shell-bundle.tsv).
shell_brew_bundle() {
  local f="$MACACFS_HOME/share/shell-bundle.tsv" kind name provides failed=0
  [ -f "$f" ] || { printf 'macacfs: missing %s\n' "$f" >&2; return 1; }
  while IFS=$'\t' read -r kind name provides; do
    case "$kind" in ''|\#*) continue ;; esac
    _brew_pkg "$kind" "$name" || failed=1
  done < <(grep -vE '^[[:space:]]*(#|$)' "$f")
  return "$failed"
}

# MesloLGS Nerd Font so Powerlevel10k icons render in a local Mac terminal.
shell_font() { _brew_pkg cask font-meslo-lg-nerd-font; }

# Oh My Zsh (unattended, keep any existing zshrc — we manage ~/.zshrc separately).
shell_omz() {
  if [ -d "$HOME/.oh-my-zsh" ]; then
    if _sh_dry; then printf '    [dry-run] oh-my-zsh already present; would update\n'; return 0; fi
    [ -d "$HOME/.oh-my-zsh/.git" ] && git -C "$HOME/.oh-my-zsh" pull --ff-only 2>&1 || true
    return 0
  fi
  if _sh_dry; then printf '    [dry-run] install oh-my-zsh (unattended, keep-zshrc, no chsh)\n'; return 0; fi
  RUNZSH=no KEEP_ZSHRC=yes CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

# Powerlevel10k theme + the pre-baked ~/.p10k.zsh preset.
shell_p10k() {
  local custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  _sh_git_get https://github.com/romkatv/powerlevel10k.git "$custom/themes/powerlevel10k" --depth=1
  if _sh_dry; then printf '    [dry-run] install %s -> ~/.p10k.zsh\n' "share/p10k.zsh"; return 0; fi
  cp "$MACACFS_HOME/share/p10k.zsh" "$HOME/.p10k.zsh"
}

# zsh-autosuggestions + zsh-syntax-highlighting plugins.
shell_plugins() {
  local custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  _sh_git_get https://github.com/zsh-users/zsh-autosuggestions "$custom/plugins/zsh-autosuggestions"
  _sh_git_get https://github.com/zsh-users/zsh-syntax-highlighting.git "$custom/plugins/zsh-syntax-highlighting"
}

# The mac-adapted managed zshrc: install the body and a loader ~/.zshrc,
# backing up any pre-existing non-managed ~/.zshrc first.
shell_zshrc() {
  local src="$MACACFS_HOME/share/zshrc.mac.zsh" body="$HOME/.macacfs.zshrc" rc="$HOME/.zshrc"
  if _sh_dry; then
    printf '    [dry-run] install %s -> %s; back up existing %s; write managed loader\n' "$src" "$body" "$rc"
    return 0
  fi
  cp "$src" "$body"
  if [ -f "$rc" ] && ! grep -q 'macacfs managed zshrc' "$rc" 2>/dev/null; then
    mv "$rc" "$rc.bak.$(date +%s)"
    printf '    backed up existing ~/.zshrc\n'
  fi
  printf '# macacfs managed zshrc loader\nsource "$HOME/.macacfs.zshrc"\n' > "$rc"
}

# The ACFS tmux config, installed to ~/.tmux.conf, backing up any existing one.
shell_tmux() {
  local src="$MACACFS_HOME/share/tmux.conf" dst="$HOME/.tmux.conf"
  if _sh_dry; then
    printf '    [dry-run] back up existing %s and install macacfs tmux.conf\n' "$dst"
    return 0
  fi
  if [ -f "$dst" ] && ! grep -q 'macacfs tmux configuration' "$dst" 2>/dev/null; then
    mv "$dst" "$dst.bak.$(date +%s)"
    printf '    backed up existing ~/.tmux.conf\n'
  fi
  cp "$src" "$dst"
  # Reload only if a tmux server is already running (never START one — r-no-servers).
  if tmux ls >/dev/null 2>&1; then tmux source-file "$dst" 2>/dev/null || true; fi
}

shell_zoxide()  { _brew_pkg formula zoxide; }
shell_lazygit() { _brew_pkg formula lazygit; }
shell_astgrep() { _brew_pkg formula ast-grep; }

# atuin + the agent-safe shim (share/atuin-guard.sh) placed ahead of it on PATH.
shell_atuin() {
  _brew_pkg formula atuin || return 1
  local real shim="$HOME/.local/bin/atuin"
  real="$(_sh_brew_prefix)/bin/atuin"
  if _sh_dry; then
    printf '    [dry-run] install atuin agent-safe shim %s (real: %s)\n' "$shim" "$real"
    return 0
  fi
  [ -x "$real" ] || { printf 'macacfs: atuin binary not found at %s\n' "$real" >&2; return 1; }
  mkdir -p "$HOME/.local/bin"
  if [ -e "$shim" ] && ! grep -Fq 'agent hook integration disabled by macacfs' "$shim" 2>/dev/null; then
    mv "$shim" "$shim.bak.$(date +%s)"
  fi
  sed "s#__REAL_ATUIN__#$real#g" "$MACACFS_HOME/share/atuin-guard.sh" > "$shim"
  chmod 0755 "$shim"
}

# --- orchestrator -----------------------------------------------------------
# shell_run <install|refresh>
shell_run() {
  local mode="${1:-install}" steps pair label fn
  require_darwin 2>/dev/null || true
  prereq_ensure brew          # ensure Homebrew (+git) are present; best-effort
  if [ "$mode" = refresh ]; then
    steps="brew-bundle:shell_brew_bundle nerd-font:shell_font zoxide:shell_zoxide lazygit:shell_lazygit ast-grep:shell_astgrep atuin:shell_atuin"
    printf '\nRefreshing the terminal environment%s...\n' "$(_sh_dry && echo ' [dry-run]')"
  else
    steps="brew-bundle:shell_brew_bundle nerd-font:shell_font oh-my-zsh:shell_omz zsh-plugins:shell_plugins powerlevel10k:shell_p10k managed-zshrc:shell_zshrc tmux-config:shell_tmux zoxide:shell_zoxide lazygit:shell_lazygit ast-grep:shell_astgrep atuin:shell_atuin"
    printf '\nSetting up the terminal environment%s...\n' "$(_sh_dry && echo ' [dry-run]')"
  fi
  report_init
  for pair in $steps; do
    label="${pair%%:*}"; fn="${pair##*:}"
    if _sh_dry; then
      printf '  → %s\n' "$label"
      "$fn"
      report_add "$label" ok "(dry-run)"
    else
      run_isolated "$label" "$mode" "$fn"
    fi
  done
  report_render
}
