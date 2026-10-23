<!--stratified-action
{
  "created": 1789599605,
  "disc_stamp": {
    "disc-callout-distal": "1.0.0",
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
  "edges": [
    {
      "dst": "req-terminal-environment-parity",
      "reason": "Routing each catalog entry to brew, cask, the omz installer, git clones, zshrc writing, or tool installs is how every parity component gets provisioned on macOS.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "shell-setup-dispatch",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0062",
  "version": 1
}
-->

Route each terminal-environment action to its macOS method, in one of two modes. Install mode runs all eleven steps: brew install-or-upgrade for the bundle, the Nerd Font cask, the official Oh My Zsh installer (unattended, keeping zshrc, no chsh), git clone-or-ff-pull for Powerlevel10k and the two zsh plugins plus copying the p10k preset, writing the managed zshrc loader and the tmux config (backing up any foreign prior file), and brew installs of zoxide, lazygit, ast-grep and atuin with its agent-safe shim. Refresh mode runs only the six Homebrew steps (bundle, font, zoxide, lazygit, ast-grep, atuin) and never rewrites shell config. Each step runs isolated and lands in a ✅/❌ summary. It [[shell-setup-experience|serves|The terminal setup the user sees is this routing of each component to its macOS method.]] and is [[shell-setup-functions|accomplished-by|The per-action shell functions and the shell_run orchestrator realize this dispatch.]]. It [[cli-arg-dispatch|couples-with|Which mode runs, and whether it runs at all, is decided by the CLI dispatcher: only a no-selector install triggers install mode and only a no-selector update triggers refresh mode.]] It [[macacfs-command-surface|serves|A full 'macacfs install' runs this install mode and a full 'macacfs update' runs this refresh mode.]].
