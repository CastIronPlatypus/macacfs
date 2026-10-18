<!--stratified-action
{
  "created": 1789599668,
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
      "reason": "These functions each perform one parity step, like cask font install, p10k clone, or zshrc write with backup, honoring dry-run and returning status.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "shell-setup-functions",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0064",
  "version": 1
}
-->

The lib/shell.sh functions that each perform one provisioning action — brew bundle install/upgrade, the Nerd Font cask, the Oh My Zsh installer (or ff-pull if present), Powerlevel10k and plugin clone-or-pull plus the p10k preset copy, the managed-zshrc write with backup, the tmux config install with backup, zoxide, lazygit, ast-grep, and atuin plus its shim — each idempotent, honoring dry-run and returning a clear status — together with the shell_run orchestrator that sequences them in install or refresh mode. It [[shell-setup-dispatch|serves|These functions and their orchestrator realize the per-component dispatch.]] and is [[shell-fns-code|accomplished-by|The functions are realized by the concrete code in lib/shell.sh.]]. It [[shell-spec-store|reads|The bundle step reads share/shell-bundle.tsv and the zshrc, p10k, tmux and atuin steps copy or render the shipped share/ assets.]]
