<!--stratified-action
{
  "created": 1789599516,
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
      "dst": "terminal-environment-parity",
      "reason": "Giving the Mac user ACFS's shell UX, CLI bundle, tmux config and standalone tools from a full install is the observable answer to the terminal-parity problem.",
      "type": "serves"
    },
    {
      "dst": "req-terminal-environment-parity",
      "reason": "Under 'macacfs install' the user gets Oh My Zsh, p10k, plugins, managed zshrc, tmux config, Nerd Font, brew bundle, and atuin/zoxide/lazygit/ast-grep, i.e. parity.",
      "type": "validated-by"
    },
    {
      "dst": "req-never-start-servers",
      "reason": "Shell setup never runs 'atuin daemon' and reloads tmux only if a server is already running, so it starts no long-running service.",
      "type": "validated-by"
    },
    {
      "dst": "req-macos-only",
      "reason": "Terminal setup relies on Homebrew, brew casks, and a mac-adapted zshrc, keeping it on macOS-native mechanisms with no Ubuntu or systemd machinery.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "shell-setup-experience",
  "node_type": "surface",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "surface",
  "uid": "n0060",
  "version": 1
}
-->

As part of a full 'macacfs install' with no TOOL selectors (there is no standalone shell command, and 'macacfs install TOOL...' skips it), right after the tool installs macacfs sets up the terminal environment: it ensures Homebrew (and git) are present, then installs the modern-CLI Homebrew bundle, a MesloLGS Nerd Font, Oh My Zsh, the zsh-autosuggestions/zsh-syntax-highlighting plugins, Powerlevel10k with its pre-baked ~/.p10k.zsh preset, a mac-adapted managed ~/.zshrc loader (backing up any existing file), the ACFS tmux config at ~/.tmux.conf (backing up any existing file), and the standalone tools zoxide, lazygit, ast-grep and atuin (wrapped in an agent-safe shim on ~/.local/bin). A full 'macacfs update' re-runs only the Homebrew part (bundle, font, zoxide, lazygit, ast-grep, atuin) without rewriting shell config. It never starts a daemon (no 'atuin daemon', and it re-sources tmux config only if a server is already running), honors --dry-run (no real installs), and reports per-item success/failure in its own ✅/❌ summary. This surface [[terminal-environment-parity|serves|Giving the Mac user ACFS's shell UX, CLI bundle, tmux config and standalone tools from a full install is the observable answer to the terminal-parity problem.]]. It is [[shell-environment-catalog|accomplished-by|The catalog fixes which formulae, cask, shell components and standalone tools are provisioned.]] and [[shell-setup-dispatch|accomplished-by|The dispatch routes each component to its macOS install method in install or refresh mode.]], reusing [[prereq-autoinstaller|accomplished-by|The prereq gate is reused to ensure Homebrew and git before any brew step.]] for Homebrew and [[isolated-runner-reporter|accomplished-by|The isolated runner and reporter run each step and render the per-item summary.]] for the per-item summary.
