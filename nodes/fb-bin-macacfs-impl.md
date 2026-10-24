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
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-bin-macacfs-impl@v7",
  "uid": "n0048",
  "version": 8
}
-->

Implementation of bin/macacfs; it [[fb-bin-macacfs|serves|This implementation fulfills the bin/macacfs bead: the entrypoint that resolves its install home, sources the libs, and dispatches every verb.]]. It resolves MACACFS_HOME by following the ~/.local/bin symlink, exports MACACFS_MANIFEST, and sources the ten lib/*.sh files (including lib/config.sh, and lib/pathcheck.sh right after lib/codesign.sh). 'install' runs run_tools over the selected tools (all 42 when none are named) and, only on a full no-selector install, then runs shell_run install for the terminal environment, all under one command honoring --dry-run and reporting per item; there is no standalone 'shell' verb. 'update' does the same with shell_run refresh, brew-upgrading the shell bundle on a full update. run_tools resolves selectors (failing loud on an unknown one), ensures prerequisites for the methods in play, and runs each tool through run_isolated + install_and_verify_row from lib/codesign.sh so every install is followed by code-signature verification and ad-hoc repair, the CLI path audit from [[fb-lib-pathcheck-impl|calls|bin/macacfs sources lib/pathcheck.sh so install_and_verify_row can call path_audit_row and _sig_candidates can call row_cli_resolved.]], and the tool's post-install hook; under --dry-run it calls dispatch_row directly, prints '[dry-run] post_install_<ABBR>' for tools that have one, and records the row with the dispatcher's RUN_STATUS and RUN_NOTE (default ok and (dry-run)), so skip rows read skipped with their reason. The shebang is pinned to Homebrew bash (#!/opt/homebrew/bin/bash), not #!/usr/bin/env bash, because env resolved macOS /bin/bash 3.2 when the launchd tick ran with a bare PATH; this [[fb-lib-schedule|couples-with|The LaunchAgent PATH that schedule_path bakes into the plist and this pinned shebang must jointly guarantee the tick runs under Homebrew bash with brew/cargo/go visible.]]. The selector list is passed as ${SELECTORS[@]+"${SELECTORS[@]}"} so a full install/update never trips set -u's unbound-variable abort on an empty array. 'newproj' and its alias 'new' require Darwin, print [[fb-lib-prereq-impl|calls|The newproj dispatch first calls prereq_warn_newproj to name any missing gh, ru, br or python3.]]'s newproj notes, then exec "$BASH" lib/newproj/newproj.sh with the remaining arguments, so the acfs-ported scripts run under this same pinned Homebrew bash; they [[fb-lib-newproj-core-impl|calls|bin/macacfs hands every newproj argument to lib/newproj/newproj.sh.]]. 'config' runs config_main from [[fb-lib-config-impl|calls|bin/macacfs sources lib/config.sh and dispatches the config verb to config_main.]]. The usage text lists both new verbs.
