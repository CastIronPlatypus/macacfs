<!--stratified-action
{
  "accept": "Running a full 'macacfs install' (no TOOL args) installs omz/p10k/plugins/font, the brew CLI bundle, the tmux config (~/.tmux.conf, prior file backed up), and atuin(+shim)/zoxide/lazygit/ast-grep; ~/.zshrc becomes a managed loader with the prior file backed up; 'macacfs install TOOL...' skips shell setup; --dry-run performs no installs; a full 'macacfs update' brew-upgrades the bundle, font, zoxide, lazygit, ast-grep and atuin.",
  "created": 1789599516,
  "disc_stamp": {
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "legacy_id": "r-terminal-env",
  "name": "req-terminal-environment-parity",
  "node_type": "requirement",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0093",
  "version": 1
}
-->

Set up the macOS terminal environment to ACFS parity: Oh My Zsh + Powerlevel10k + zsh plugins + a mac-adapted managed zshrc (backing up any existing one) + a Nerd Font, a modern-CLI Homebrew bundle, a tmux config (installed to ~/.tmux.conf, backing up any existing one), and standalone tools (atuin with an agent-safe shim, zoxide, lazygit, ast-grep), performed as part of a full 'macacfs install' (no tool selectors); a full 'macacfs update' also refreshes the Homebrew bundle and the brew-installed standalone tools without rewriting shell config.
