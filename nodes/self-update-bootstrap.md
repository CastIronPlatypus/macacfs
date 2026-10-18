<!--stratified-action
{
  "created": 1789593709,
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
      "reason": "The bootstrap/self-update mechanism is delivered by this surface.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-self-update",
      "reason": "This problem states macacfs must self-update via the ACFS bootstrap pattern using a canonical repo URL and atomic replace, which the requirement formalizes.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "self-update-bootstrap",
  "node_type": "problem",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0009",
  "version": 1
}
-->

macacfs must update itself (the ACFS bootstrap pattern) via a 'self-update' subcommand (also accepted as --self-update): fetch its repo and replace the installed copy with the latest. That needs its own canonical public repo URL and a safe replace of the installed home (fast-forward a git checkout, or re-clone and swap without losing the original on failure); the same repo also backs the one-liner curl|bash install. The problem is [[bootstrap-and-self-update|accomplished-by|The one-liner bootstrap and the self-update subcommand are the surface that delivers this mechanism.]]
