<!--stratified-action
{
  "accept": "Running 'macacfs shell' installs omz/p10k/plugins/font, the brew CLI bundle, the tmux config (~/.tmux.conf, prior file backed up), and atuin(+shim)/zoxide/lazygit/ast-grep; ~/.zshrc becomes a managed loader with the prior file backed up; --dry-run performs no installs; 'macacfs update' brew-upgrades the bundle.",
  "created": 1789599516,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "legacy_id": "r-terminal-env",
  "name": "req-terminal-environment-parity",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0093",
  "version": 1
}
-->

Set up the macOS terminal environment to ACFS parity: Oh My Zsh + Powerlevel10k + zsh plugins + a mac-adapted managed zshrc (backing up any existing one) + a Nerd Font, a modern-CLI Homebrew bundle, a tmux config (installed to ~/.tmux.conf, backing up any existing one), and standalone tools (atuin with an agent-safe shim, zoxide, lazygit, ast-grep), exposed via a 'macacfs shell' subcommand; 'macacfs update' also refreshes the Homebrew bundle.
