<!--stratified-action
{
  "created": 1789599716,
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
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0067",
  "version": 1
}
-->

The lib/shell.sh file boundary: one function per terminal-environment provisioning action (shell_brew_bundle, shell_font, shell_omz, shell_plugins, shell_p10k, shell_zshrc, shell_tmux, shell_zoxide, shell_lazygit, shell_astgrep, shell_atuin) plus the shell_run <install|refresh> dispatcher, invoked by a full 'macacfs install' (install) and a full 'macacfs update' (refresh); each action is idempotent, dry-run-aware, and never starts a daemon. It [[shell-fns-code|serves|This file holds the shell provisioning functions code unit.]] and is [[fb-lib-shell-impl|accomplished-by|lib/shell.sh contains the per-action provisioning functions plus shell_run.]]. It installs the share/ assets, and [[fb-share-atuin-guard|couples-with|shell_atuin substitutes the shim's __REAL_ATUIN__ placeholder and recognizes an installed shim by its marker comment, so this file and share/atuin-guard.sh must agree on both strings.]].
