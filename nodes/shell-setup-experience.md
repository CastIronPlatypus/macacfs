<!--stratified-action
{
  "created": 1789599516,
  "edges": [
    {
      "dst": "terminal-environment-parity",
      "reason": "The terminal-environment-parity problem is accomplished by this surface; this is the upward reciprocal of the problem's accomplished-by edge.",
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
  "status": "drafting",
  "stratum": "surface",
  "uid": "n0060",
  "version": 1
}
-->

As part of 'macacfs install' (there is no standalone shell command), macacfs sets up the terminal environment: it auto-installs Homebrew if missing, then installs Oh My Zsh, Powerlevel10k, the zsh-autosuggestions/zsh-syntax-highlighting plugins, a mac-adapted managed ~/.zshrc (backing up any existing file) with the p10k preset, the ACFS tmux config at ~/.tmux.conf (backing up any existing file), a MesloLGS Nerd Font, the modern-CLI Homebrew bundle, and the standalone tools atuin (wrapped in an agent-safe shim), zoxide, lazygit, and ast-grep. It never starts a daemon (no 'atuin daemon', and it reloads tmux only if a server is already running), honors --dry-run (no real installs), and reports per-item success/failure. Accomplished by [[shell-environment-catalog|accomplished-by]] and [[shell-setup-dispatch|accomplished-by]], reusing [[prereq-autoinstaller|accomplished-by]] for Homebrew and [[isolated-runner-reporter|accomplished-by]] for the per-item summary.
