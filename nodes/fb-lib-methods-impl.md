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
  "uid": "n0051",
  "version": 1
}
-->

Implementation of lib/methods.sh; it [[fb-lib-methods|serves|The lib/methods.sh file is the concrete implementation that fulfills the install-methods bead.]]. It defines _m_run (echo under DRY_RUN, else execute), do_brew (brew upgrade if the formula is listed, tolerating brew's non-zero 'up to date' and then confirming it is still listed, else brew install), do_installer_sh (curl -fsSL the repo's raw main installer from github.com/Dicklesworthstone and pipe it to bash, passing args via bash -s --), do_cargo_git (cargo install --git <ref> --force plus extra args), do_go (go install <ref>, appending @latest when no version is given), and dispatch_row, which reads method/repo/ref/args from the row and returns 2 with an error for an unknown method. None of these start a tool's server or daemon. The method names in its case statement [[fb-manifest-tsv-impl|couples-with|dispatch_row only recognizes brew, installer-sh, cargo-git and go, so the method column values in share/manifest.tsv must use exactly those spellings.]].
