<!--stratified-action
{
  "created": 1789594981,
  "edges": [
    {
      "dst": "fb-bin-macacfs",
      "reason": "This implementation fulfills the bin/macacfs bead, running tools then shell setup under install and guarding empty selector arrays against set -u aborts.",
      "type": "serves"
    }
  ],
  "impl_path": "bin/macacfs",
  "is_bead": true,
  "name": "fb-bin-macacfs-impl",
  "node_type": "impl",
  "realized_at": "0.14.0",
  "realized_fp": "1789594752:4314",
  "retire_reason": "run_tools now runs each tool through install_and_verify_row (lib/codesign.sh) so signature repair follows every install.",
  "retired_at": 1792285815,
  "status": "retired",
  "stratum": "implementation",
  "succeeds": "fb-bin-macacfs-impl@v3",
  "uid": "n0048",
  "version": 4
}
-->

Implementation of fb-bin-macacfs: `bin/macacfs` — the 'install' subcommand runs run_tools (39 tools) then shell_run install (terminal environment) in one command, honoring --dry-run and reporting per-item; there is no standalone 'shell' case. 'update' updates tools and, on a full update, also brew-upgrades the shell bundle (shell_run refresh). The shebang is pinned to Homebrew bash (`#!/opt/homebrew/bin/bash`), not `#!/usr/bin/env bash`: the launchd update tick runs with a bare PATH, where env resolved macOS /bin/bash 3.2. The selector list is passed as `${SELECTORS[@]+"${SELECTORS[@]}"}` so a full (no-selector) install/update never trips set -u's unbound-variable abort on an empty array. Bead.
