<!--stratified-action
{
  "created": 1789593935,
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
      "dst": "self-update-capability",
      "reason": "Self-update is realized by fetching the repo and atomically replacing the installed CLI.",
      "type": "serves"
    },
    {
      "dst": "selfupdate-code",
      "reason": "The fetch/replace subsystem is realized by the self-update code.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-self-update",
      "reason": "Cloning or pulling the public repo and atomically replacing the installed script, libs, and manifest is the core mechanism of self-update.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "repo-fetch-replace",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0028",
  "version": 1
}
-->

Bring the installed macacfs home up to the latest public repo: if the install home is a git checkout, fast-forward it with git pull --ff-only from its origin; otherwise shallow-clone the repo into a temp dir and swap it in (move the old home aside, move the new one in, then drop the old), preserving the original if the swap fails. Under dry-run it only prints what it would do. Afterward it re-marks the CLI executable and prints the new VERSION. It [[self-update-capability|serves|This fetch-and-replace mechanism is what realizes macacfs updating itself.]] and is [[selfupdate-code|accomplished-by|lib/selfupdate.sh's selfupdate_run implements the pull-or-reclone-and-swap.]]. It [[fb-install-sh|couples-with|The fast-forward path relies on install.sh having left a git checkout at the install home; if the bootstrap stopped cloning, every self-update would fall to the re-clone-and-swap path.]]
