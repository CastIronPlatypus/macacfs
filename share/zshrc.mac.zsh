# macacfs mac-adapted zshrc.
# Realizes: fb-share-zshrc-mac. Installed to ~/.macacfs.zshrc and sourced by a
# managed ~/.zshrc loader (lib/shell.sh -> shell_zshrc), which backs up any
# pre-existing ~/.zshrc first.
#
# This is the ACFS terminal experience, adapted for macOS + Homebrew.

# --- Homebrew (Apple Silicon or Intel) --------------------------------------
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# ~/.local/bin FIRST so the atuin agent-safe shim wins over Homebrew's atuin.
export PATH="$HOME/.local/bin:$PATH"

# --- Oh My Zsh + Powerlevel10k ----------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
[ -d "$ZSH" ] && source "$ZSH/oh-my-zsh.sh"
# p10k preset (skips the config wizard on first login).
[ -f "$HOME/.p10k.zsh" ] && source "$HOME/.p10k.zsh"

# --- Modern-CLI aliases (only when the tool is installed) --------------------
command -v eza  >/dev/null 2>&1 && { alias ls='eza --group-directories-first'; alias ll='eza -la --group-directories-first'; alias tree='eza --tree'; }
command -v bat  >/dev/null 2>&1 && alias cat='bat --paging=never'
command -v btop >/dev/null 2>&1 && alias top='btop'
command -v nvim >/dev/null 2>&1 && alias vim='nvim'
command -v lazygit >/dev/null 2>&1 && alias lg='lazygit'

# --- Navigation + history ----------------------------------------------------
# zoxide: smarter cd (`z <dir>`).
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
# atuin: searchable shell history. The macacfs shim on ~/.local/bin keeps it out
# of the way inside agent sessions.
command -v atuin  >/dev/null 2>&1 && eval "$(atuin init zsh)"
