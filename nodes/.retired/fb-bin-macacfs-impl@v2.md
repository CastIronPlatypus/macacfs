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
  "retire_reason": "install now runs run_tools then shell_run (tools + terminal env in one command); remove the standalone shell subcommand.",
  "retired_at": 1789615458,
  "status": "retired",
  "stratum": "implementation",
  "succeeds": "fb-bin-macacfs-impl@v1",
  "uid": "n0048",
  "version": 2
}
-->

Implementation of fb-bin-macacfs: `bin/macacfs` — adds the 'shell' subcommand (sources lib/shell.sh and runs shell_run, honoring --dry-run and reporting per-item) to the argv dispatch, and extends 'update' to also brew-upgrade the modern-CLI shell bundle. Bead.
