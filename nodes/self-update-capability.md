<!--stratified-action
{
  "created": 1789593894,
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
      "dst": "bootstrap-and-self-update",
      "reason": "The one-liner install and self-update command are realized by this fetch-and-replace capability.",
      "type": "serves"
    },
    {
      "dst": "repo-fetch-replace",
      "reason": "Self-update is realized by fetch-and-replace.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-self-update",
      "reason": "Fetching the public repo and replacing the installed macacfs home with the latest (ff-pull or re-clone-and-swap), then printing the new VERSION, is the capability that delivers self-update.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "self-update-capability",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0021",
  "version": 1
}
-->

On 'macacfs self-update [--dry-run]' (macOS only), bring the installed macacfs home up to the latest public repo — fast-forwarding it when it is a git checkout, otherwise re-cloning and swapping it in — then report the new VERSION, failing loud with the preserved location if the pull or swap fails. The one-liner install.sh performs its own analogous clone-or-pull for the first install; it does not call this capability. It [[bootstrap-and-self-update|serves|The self-update command of the bootstrap-and-self-update surface is realized by this fetch-and-replace capability.]] and is [[repo-fetch-replace|accomplished-by|Self-update is realized by the repo fetch-and-replace subsystem.]]
