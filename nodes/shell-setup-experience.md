<!--stratified-action
{
  "created": 1789599516,
  "edges": [
    {
      "dst": "terminal-environment-parity",
      "reason": "The terminal-environment-parity problem is accomplished by this surface; this is the upward reciprocal of the problem's accomplished-by edge.",
      "type": "serves"
    }
  ],
  "is_bead": false,
  "name": "shell-setup-experience",
  "node_type": "surface",
  "obligations": [
    "r-terminal-env",
    "r-no-servers",
    "r-macos-only"
  ],
  "status": "drafting",
  "stratum": "surface",
  "uid": "n0060",
  "version": 1
}
-->

What the user sees on 'macacfs shell': it auto-installs Homebrew if missing, then sets up the terminal environment — Oh My Zsh, Powerlevel10k, the zsh-autosuggestions/zsh-syntax-highlighting plugins, a mac-adapted managed ~/.zshrc (backing up any existing file) with the p10k preset, a MesloLGS Nerd Font, the modern-CLI Homebrew bundle, and the standalone tools atuin (wrapped in an agent-safe shim), zoxide, lazygit, and ast-grep. It never starts a daemon (no 'atuin daemon'), honors --dry-run (no real installs), and reports per-item success/failure. Accomplished by [[shell-environment-catalog|accomplished-by]] and [[shell-setup-dispatch|accomplished-by]], reusing [[prereq-autoinstaller|accomplished-by]] for Homebrew and [[isolated-runner-reporter|accomplished-by]] for the per-item summary.
