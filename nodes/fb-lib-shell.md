<!--stratified-action
{
  "created": 1789599716,
  "edges": [
    {
      "dst": "fb-lib-shell-impl",
      "reason": "The shell-provisioning bead is realized by lib/shell.sh, containing shell_brew_bundle, shell_omz, shell_p10k, shell_tmux and the other per-action functions plus shell_run.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-terminal-environment-parity",
      "reason": "lib/shell.sh performs each ACFS-parity provisioning step, from Oh My Zsh and p10k to the brew bundle, font, zshrc, atuin, zoxide, lazygit, and ast-grep.",
      "type": "validated-by"
    },
    {
      "dst": "req-dry-run-no-side-effects",
      "reason": "Each lib/shell.sh provisioning function is dry-run-aware, so terminal setup under 'install --dry-run' changes nothing and only reports intended actions.",
      "type": "validated-by"
    },
    {
      "dst": "req-never-start-servers",
      "reason": "lib/shell.sh functions never start a daemon such as atuin's, keeping terminal-environment setup within the install-binaries-only rule.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-shell",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0067",
  "version": 1
}
-->

lib/shell.sh — one function per provisioning action (shell_brew_bundle, shell_font, shell_omz, shell_p10k, shell_plugins, shell_zshrc, shell_atuin, shell_zoxide, shell_lazygit, shell_astgrep) plus a shell_run dispatcher; each is idempotent, dry-run-aware, and never starts a daemon. Realizes [[shell-fns-code|serves]]. Bead.
