<!--stratified-action
{
  "created": 1789594032,
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
      "dst": "repo-fetch-replace",
      "reason": "This code realizes the fetch-and-replace subsystem.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-selfupdate",
      "reason": "The self-update code lives in lib/selfupdate.sh.",
      "type": "accomplished-by"
    },
    {
      "dst": "fb-install-sh",
      "reason": "install.sh performs the first-time clone of the same repo into ~/.macacfs (or ff-pulls an existing checkout) that selfupdate_run later updates, so the bootstrap half of this unit lives there.",
      "type": "accomplished-by"
    },
    {
      "dst": "fb-readme",
      "reason": "The README documents the one-liner bootstrap and the 'macacfs self-update' usage this unit implements.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-self-update",
      "reason": "This code unit fast-forwards or re-clones-and-swaps the installed macacfs home and prints the new VERSION, so 'macacfs self-update' yields the latest version.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "selfupdate-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0035",
  "version": 1
}
-->

Code unit selfupdate_run: under dry-run it prints the pull or re-clone it would do; if MACACFS_HOME is a git checkout it runs git pull --ff-only (reporting the origin URL) and fails loud if that cannot fast-forward; otherwise it shallow-clones MACACFS_REPO_URL into a temp dir, moves the old home aside, moves the new one in, and drops the old, preserving it and failing loud if the swap breaks. It then re-marks bin/macacfs executable and prints the new VERSION. It [[repo-fetch-replace|serves|This code realizes the repo fetch-and-replace subsystem.]] and is [[fb-lib-selfupdate|accomplished-by|selfupdate_run lives in lib/selfupdate.sh.]], [[fb-install-sh|accomplished-by|install.sh performs the first-time clone of the same repo into ~/.macacfs (or ff-pulls an existing checkout) that selfupdate_run later updates, so the bootstrap half of this unit lives there.]], and [[fb-readme|accomplished-by|The README documents the one-liner bootstrap and the 'macacfs self-update' usage this unit implements.]]
