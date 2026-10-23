<!--stratified-action
{
  "created": 1792790752,
  "edges": [
    {
      "dst": "req-macos-only",
      "reason": "every mutating command is gated by require_darwin before anything runs",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-cli-dispatch",
  "node_type": "impl",
  "retire_reason": "Command dispatch gains the newproj|new and config branches.",
  "retired_at": 1792795298,
  "status": "retired",
  "stratum": "logical-flow",
  "uid": "n0199",
  "version": 1
}
-->

Command dispatch: bin/macacfs resolves its install home through any symlink chain, exports MACACFS_HOME and MACACFS_MANIFEST, sources every lib file, then main reads the first argument and routes it: install and update go to the tool-run engine (and, when no tool is named, to shell setup in install or refresh mode, folding both return codes into the exit code); self-update to the repo refresh; schedule --install/--uninstall/--status to the LaunchAgent manager; the internal _tick to the scheduled tick; list prints the catalog; version and help print text; anything else prints usage and exits 2. This flow [[fb-bin-macacfs|serves|The flow is realized by code in bin/macacfs.]]. It is carried out step by step by [[fn-resolve-dir|accomplished-by|_resolve_dir performs part of this flow.]], [[fn-require-darwin|accomplished-by|require_darwin performs part of this flow.]], [[fn-usage|accomplished-by|usage performs part of this flow.]], [[fn-parse-dry-run|accomplished-by|parse_dry_run performs part of this flow.]], [[fn-main|accomplished-by|main performs part of this flow.]]. Related flows: [[lf-tool-run-engine|flow|install and update hand the parsed selectors to run_tools.]]; [[lf-shell-setup|flow|A full install or update (no selectors) continues into shell_run install or refresh.]]; [[lf-self-update|flow|The self-update command calls selfupdate_run.]]; [[lf-schedule-install|flow|schedule --install calls schedule_install.]]; [[lf-schedule-status-uninstall|flow|schedule --uninstall and --status call the matching schedule functions.]]; [[lf-schedule-tick|flow|The internal _tick command, fired by launchd, calls schedule_tick.]]; [[lf-catalog-selection|flow|The list command prints catalog_rows as a table.]].
