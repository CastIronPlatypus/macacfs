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
      "dst": "fb-lib-selfupdate",
      "reason": "The lib/selfupdate.sh file is the concrete implementation that fulfills the self-update bead.",
      "type": "serves"
    }
  ],
  "impl_path": "lib/selfupdate.sh",
  "is_bead": true,
  "name": "fb-lib-selfupdate-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": "1789594727:1863",
  "status": "drafting",
  "stratum": "implementation",
  "uid": "n0056",
  "version": 1
}
-->

Implementation of lib/selfupdate.sh; it [[fb-lib-selfupdate|serves|The lib/selfupdate.sh file is the concrete implementation that fulfills the self-update bead.]]. selfupdate_run prints the intended git pull or re-clone under DRY_RUN; otherwise, when MACACFS_HOME is a git checkout it fast-forwards it with git pull --ff-only (naming the origin remote URL, failing loud with a resolve-and-retry message), and when it is not it shallow-clones MACACFS_REPO_URL into a temp dir, moves the old home aside to a .bak.PID path, moves the new clone in, reports and preserves the backup if the swap fails, then removes backup and temp; finally it re-marks bin/macacfs executable and prints the new VERSION. Its default URL [[fb-install-sh-impl|couples-with|install.sh hard-codes the same default MACACFS_REPO_URL and creates the ~/.macacfs checkout this function updates, so the two must agree on the repo and prefix.]].
