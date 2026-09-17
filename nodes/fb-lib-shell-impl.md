<!--stratified-action
{
  "created": 1789599716,
  "edges": [
    {
      "dst": "fb-lib-shell",
      "type": "serves"
    }
  ],
  "impl_path": "lib/shell.sh",
  "is_bead": true,
  "is_impl": true,
  "name": "fb-lib-shell-impl",
  "obligations": [],
  "realized_at": "0.14.0",
  "realized_fp": null,
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-lib-shell-impl@v1",
  "uid": "n0068",
  "version": 2
}
-->

Implementation of fb-lib-shell: `lib/shell.sh` — one function per provisioning action (shell_brew_bundle, shell_font, shell_omz, shell_plugins, shell_p10k, shell_zshrc, shell_tmux, shell_zoxide, shell_lazygit, shell_astgrep, shell_atuin) plus the shell_run dispatcher; each idempotent, dry-run-aware, and never starting a daemon. shell_tmux installs ~/.tmux.conf from share/tmux.conf, backing up any existing file. Bead.
