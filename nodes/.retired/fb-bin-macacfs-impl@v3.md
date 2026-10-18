<!--stratified-action
{
  "created": 1789594981,
  "edges": [
    {
      "dst": "fb-bin-macacfs",
      "type": "serves"
    }
  ],
  "impl_path": "bin/macacfs",
  "is_bead": true,
  "is_impl": true,
  "name": "fb-bin-macacfs-impl",
  "node_type": "impl",
  "obligations": [],
  "realized_at": "0.14.0",
  "realized_fp": "1789594752:4314",
  "retire_reason": "launchd runs the update tick with PATH=/usr/bin:/bin, so '#!/usr/bin/env bash' resolved to macOS /bin/bash 3.2, which aborts on an empty \"${SELECTORS[@]}\" under set -u (update.err.log: 'SELECTORS[@]: unbound variable'); point the shebang at Homebrew bash and make the selector expansion empty-safe.",
  "retired_at": 1792274105,
  "status": "retired",
  "stratum": "implementation",
  "succeeds": "fb-bin-macacfs-impl@v2",
  "uid": "n0048",
  "version": 3
}
-->

Implementation of fb-bin-macacfs: `bin/macacfs` — the 'install' subcommand runs run_tools (39 tools) then shell_run install (terminal environment) in one command, honoring --dry-run and reporting per-item; there is no standalone 'shell' case. 'update' updates tools and, on a full update, also brew-upgrades the shell bundle (shell_run refresh). Bead.
