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
      "dst": "fb-lib-shell",
      "reason": "This lib/shell.sh implementation fulfills the shell bead, adding shell_tmux which installs ~/.tmux.conf from share/tmux.conf with a backup.",
      "type": "serves"
    }
  ],
  "impl_path": "lib/shell.sh",
  "is_bead": true,
  "name": "fb-lib-shell-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": null,
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-lib-shell-impl@v1",
  "uid": "n0068",
  "version": 2
}
-->

Implementation of lib/shell.sh; it [[fb-lib-shell|serves|This lib/shell.sh implementation fulfills the shell bead with one function per provisioning action plus the shell_run dispatcher.]]. One function per provisioning action (shell_brew_bundle, shell_font, shell_omz, shell_plugins, shell_p10k, shell_zshrc, shell_tmux, shell_zoxide, shell_lazygit, shell_astgrep, shell_atuin), each idempotent, dry-run-aware and never starting a daemon, plus shell_run <install|refresh>, which ensures Homebrew via prereq_ensure and runs the full eleven-step list (install) or the brew-only six-step list (refresh: bundle, font, zoxide, lazygit, ast-grep, atuin) through run_isolated and report_render. shell_zshrc copies share/zshrc.mac.zsh to ~/.macacfs.zshrc and writes a marker-tagged loader ~/.zshrc, backing up a non-managed one; shell_tmux installs ~/.tmux.conf from share/tmux.conf with a backup of a non-macacfs file and only reloads an already-running tmux server; shell_p10k copies share/p10k.zsh to ~/.p10k.zsh. shell_atuin [[fb-share-atuin-guard-impl|couples-with|It seds the __REAL_ATUIN__ placeholder in share/atuin-guard.sh and detects an existing macacfs shim by that file's 'agent hook integration disabled by macacfs' marker, so both strings must stay identical across the two files.]]; shell_tmux [[fb-share-tmux-conf-impl|couples-with|It decides whether ~/.tmux.conf is already macacfs-managed by grepping for 'macacfs tmux configuration', which must remain in share/tmux.conf's header.]]; and shell_brew_bundle [[fb-share-shell-bundle-impl|couples-with|It reads share/shell-bundle.tsv as tab-separated kind/name/provides columns, so the bundle file's column order is a contract with this reader.]].
