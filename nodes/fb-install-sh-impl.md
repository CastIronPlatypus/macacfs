<!--stratified-action
{
  "created": 1789594982,
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
      "dst": "fb-install-sh",
      "reason": "The concrete install.sh file is the implementation artifact that satisfies the install.sh bootstrap bead.",
      "type": "serves"
    }
  ],
  "impl_path": "install.sh",
  "is_bead": true,
  "name": "fb-install-sh-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": "1789594767:1466",
  "status": "drafting",
  "stratum": "implementation",
  "uid": "n0057",
  "version": 1
}
-->

Implementation of install.sh; it [[fb-install-sh|serves|The concrete install.sh file is the implementation artifact that satisfies the install.sh bootstrap bead.]]. Under set -euo pipefail it aborts on non-Darwin hosts and when git is missing (pointing at xcode-select --install), then fast-forwards an existing $MACACFS_HOME checkout (default ~/.macacfs) or clones MACACFS_REPO_URL (default the public CastIronPlatypus/macacfs repo) with --depth 1, makes bin/macacfs executable, symlinks it to ~/.local/bin/macacfs, prints a PATH export hint when ~/.local/bin is not on PATH, and suggests 'macacfs install' and 'macacfs schedule' as next steps. Its default repo URL [[fb-lib-selfupdate|couples-with|lib/selfupdate.sh carries the same default MACACFS_REPO_URL and the same ~/.macacfs checkout assumption, so the bootstrap and self-update must agree on where macacfs comes from and lives.]].
