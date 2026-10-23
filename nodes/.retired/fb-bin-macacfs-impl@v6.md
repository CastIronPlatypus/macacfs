<!--stratified-action
{
  "created": 1789594981,
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
      "dst": "fb-bin-macacfs",
      "reason": "This implementation fulfills the bin/macacfs bead, running tools then shell setup under install and guarding empty selector arrays against set -u aborts.",
      "type": "serves"
    }
  ],
  "impl_path": "bin/macacfs",
  "is_bead": true,
  "name": "fb-bin-macacfs-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": "1789594752:4314",
  "retire_reason": "bin/macacfs gains the newproj|new dispatch (exec $BASH lib/newproj/newproj.sh, after prereq_warn_newproj), the config verb (lib/config.sh), and usage lines; the catalog is now 42 tools.",
  "retired_at": 1792794745,
  "status": "retired",
  "stratum": "implementation",
  "succeeds": "fb-bin-macacfs-impl@v5",
  "uid": "n0048",
  "version": 6
}
-->

Implementation of bin/macacfs; it [[fb-bin-macacfs|serves|This implementation fulfills the bin/macacfs bead: the entrypoint that resolves its install home, sources the libs, and dispatches every verb.]]. It resolves MACACFS_HOME by following the ~/.local/bin symlink, exports MACACFS_MANIFEST, and sources the eight lib/*.sh files. 'install' runs run_tools over the selected tools (all 39 when none are named) and, only on a full no-selector install, then runs shell_run install for the terminal environment, all under one command honoring --dry-run and reporting per item; there is no standalone 'shell' verb. 'update' does the same with shell_run refresh, brew-upgrading the shell bundle on a full update. run_tools resolves selectors (failing loud on an unknown one), ensures prerequisites for the methods in play, and runs each tool through run_isolated + install_and_verify_row from lib/codesign.sh so every install is followed by code-signature verification and ad-hoc repair; under --dry-run it calls dispatch_row directly and records the row with the dispatcher's RUN_STATUS and RUN_NOTE (default ok and (dry-run)), so skip rows read skipped with their reason. The shebang is pinned to Homebrew bash (#!/opt/homebrew/bin/bash), not #!/usr/bin/env bash, because env resolved macOS /bin/bash 3.2 when the launchd tick ran with a bare PATH; this [[fb-lib-schedule|couples-with|The LaunchAgent PATH that schedule_path bakes into the plist and this pinned shebang must jointly guarantee the tick runs under Homebrew bash with brew/cargo/go visible.]]. The selector list is passed as ${SELECTORS[@]+"${SELECTORS[@]}"} so a full install/update never trips set -u's unbound-variable abort on an empty array.
