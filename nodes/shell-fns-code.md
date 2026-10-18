<!--stratified-action
{
  "created": 1789599679,
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
      "reason": "lib/shell.sh's per-action functions and shell_run dispatcher are the concrete code that provisions each parity component and reports per item.",
      "type": "validated-by"
    },
    {
      "dst": "req-never-start-servers",
      "reason": "shell_atuin installs atuin without launching its daemon and shell_tmux only re-sources config on an already-running tmux server, never starting one.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "shell-fns-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0065",
  "version": 1
}
-->

The concrete shell code in lib/shell.sh: one idempotent, dry-run-aware function per provisioning action (shell_brew_bundle, shell_font, shell_omz, shell_plugins, shell_p10k, shell_zshrc, shell_tmux, shell_zoxide, shell_lazygit, shell_astgrep, shell_atuin) built on _brew_pkg (install if missing, else upgrade) and _sh_git_get (clone if absent, else ff-pull); and shell_run <install|refresh>, which ensures Homebrew via the prereq gate, then walks the full eleven-step list (install) or the brew-only six-step list (refresh), running each step isolated and rendering its own summary. It never starts a daemon: atuin's daemon is never launched and tmux config is re-sourced only when a tmux server is already running. It [[shell-setup-functions|serves|This code realizes the shell setup functions subsystem.]] and is [[fb-lib-shell|accomplished-by|The functions and shell_run live in lib/shell.sh.]]. It [[reporter-code|couples-with|shell_run reuses report_init, run_isolated and report_render, so the reporter's contract shapes the terminal-setup summary.]] and [[shell-assets-code|couples-with|Backup decisions grep for marker text inside the shipped assets and shell_atuin fills the shim's __REAL_ATUIN__ placeholder, so asset edits change this code's behavior.]]
