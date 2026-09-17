<!--stratified-action
{
  "created": 1789599716,
  "edges": [
    {
      "dst": "fb-lib-shell-impl",
      "type": "accomplished-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-shell",
  "node_type": "impl",
  "obligations": [
    "r-terminal-env",
    "r-dry-run",
    "r-no-servers"
  ],
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0067",
  "version": 1
}
-->

lib/shell.sh — one function per provisioning action (shell_brew_bundle, shell_font, shell_omz, shell_p10k, shell_plugins, shell_zshrc, shell_atuin, shell_zoxide, shell_lazygit, shell_astgrep) plus a shell_run dispatcher; each is idempotent, dry-run-aware, and never starts a daemon. Realizes [[shell-fns-code|serves]]. Bead.
