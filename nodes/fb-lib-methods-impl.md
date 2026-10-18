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
      "dst": "fb-lib-methods",
      "reason": "The lib/methods.sh file is the concrete implementation that fulfills the install-methods bead.",
      "type": "serves"
    }
  ],
  "impl_path": "lib/methods.sh",
  "is_bead": true,
  "name": "fb-lib-methods-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": "1789594630:2717",
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-lib-methods-impl@v2",
  "uid": "n0051",
  "version": 3
}
-->

Implementation of lib/methods.sh; it [[fb-lib-methods|serves|The lib/methods.sh file is the concrete implementation that fulfills the install-methods bead.]]. It defines _m_run (echo under DRY_RUN, else execute), do_brew (brew upgrade if the formula is listed, tolerating brew's non-zero 'up to date' and then confirming it is still listed, else brew install), do_installer_sh (curl -fsSL the repo's installer from github.com/Dicklesworthstone raw content at main, or, for an @latest-release/<path> ref, at the tag the GitHub releases API names as latest (failing loud if it cannot be resolved; dry-run prints <latest-release> without resolving), and pipe it to bash under env HOOK_ENV, passing args plus HOOK_EXTRA_ARGS via bash -s --), do_cargo_git (cargo install --git <ref> --force plus extra args), do_go (go install <ref>, appending @latest when no version is given), do_skip (print the reason, set RUN_STATUS=skip and RUN_NOTE), and dispatch_row, which resets HOOK_ENV/HOOK_EXTRA_ARGS, runs pre_install_<ABBR> when defined, then dispatches, returning 2 with an error for an unknown method. None of these start a tool's server or daemon. The method names in its case statement [[fb-manifest-tsv-impl|couples-with|dispatch_row only recognizes brew, installer-sh, cargo-git, go and skip, so the method column values in share/manifest.tsv must use exactly those spellings.]]. It sources [[fb-lib-hooks|calls|lib/methods.sh sources lib/hooks.sh at load so dispatch_row can find each pre_install_<ABBR> hook.]] at load. do_skip's status and note [[fb-lib-report-impl|couples-with|run_isolated in lib/report.sh resets and records RUN_STATUS and RUN_NOTE, which do_skip sets to skip and the reason, so a skipped row only renders as skipped while both files share those globals.]], and do_installer_sh's HOOK_ENV and HOOK_EXTRA_ARGS [[fb-lib-hooks|couples-with|The hooks in lib/hooks.sh fill HOOK_ENV and HOOK_EXTRA_ARGS, which do_installer_sh applies to the installer, so the two files must agree on those array names and shapes.]].
