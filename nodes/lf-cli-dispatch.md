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
  "in_progress": false,
  "is_bead": false,
  "name": "lf-cli-dispatch",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "logical-flow",
  "succeeds": "lf-cli-dispatch@v1",
  "uid": "n0199",
  "version": 2
}
-->

Command dispatch: bin/macacfs resolves its install home through any symlink chain, exports MACACFS_HOME and MACACFS_MANIFEST, sources every lib file, then main reads the first argument and routes it: install and update go to the tool-run engine (and, when no tool is named, to shell setup in install or refresh mode, folding both return codes into the exit code); self-update to the repo refresh; schedule --install/--uninstall/--status to the LaunchAgent manager; the internal _tick to the scheduled tick; newproj (alias new) to the newproj dispatcher and config to the settings verb; list prints the catalog; version and help print text; anything else prints usage and exits 2. This flow [[fb-bin-macacfs|serves|The flow's code must live in bin/macacfs, because the installed symlink and the LaunchAgent both invoke that file.]]. It is carried out step by step by [[fn-resolve-dir|accomplished-by|_resolve_dir must follow the ~/.local/bin symlink, otherwise MACACFS_HOME would point at the link directory and no lib would load.]], [[fn-require-darwin|accomplished-by|require_darwin gates every mutating verb, so on a non-Mac nothing runs.]], [[fn-usage|accomplished-by|usage is printed for help and for any unknown verb, which must also exit 2.]], [[fn-parse-dry-run|accomplished-by|parse_dry_run must separate --dry-run from selectors, otherwise --dry-run becomes an unknown tool.]], [[fn-main|accomplished-by|main performs the routing, so without it no verb reaches its handler.]]. Related flows: [[lf-tool-run-engine|flow|install and update hand the parsed selectors to run_tools, whose exit code becomes theirs.]]; [[lf-shell-setup|flow|Only a full install or update (no selectors) continues into shell_run install or refresh, so named installs never touch shell config.]]; [[lf-self-update|flow|The self-update command calls selfupdate_run, which must honor --dry-run.]]; [[lf-schedule-install|flow|schedule --install calls schedule_install, which must write and load the LaunchAgent plist.]]; [[lf-schedule-status-uninstall|flow|schedule --uninstall and --status call the matching functions, and only --uninstall may change launchd state.]]; [[lf-schedule-tick|flow|The internal _tick command, fired by launchd, calls schedule_tick, so the plist must name _tick or no scheduled run happens.]]; [[lf-catalog-selection|flow|The list command prints catalog_rows as a table, so it depends on the manifest parsing.]]. newproj and its alias new continue into [[lf-newproj-dispatch|flow|main's newproj branch exec's lib/newproj/newproj.sh under the same Homebrew bash, so the ported scripts never run under /bin/bash 3.2.]], and config continues into [[lf-config-verb|flow|main's config branch hands its arguments to config_main and exits with its status.]].
