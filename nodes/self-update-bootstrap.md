<!--stratified-action
{
  "created": 1789593709,
  "edges": [
    {
      "dst": "bootstrap-and-self-update",
      "reason": "The bootstrap/self-update mechanism is delivered by this surface.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "self-update-bootstrap",
  "node_type": "problem",
  "obligations": [
    "r-self-update"
  ],
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0009",
  "version": 1
}
-->

macacfs must self-update via a bootstrap flag (the ACFS pattern): fetch the repo and reinstall itself. It needs its own canonical repo URL and an atomic replace of the running script; this also enables the one-liner install. Accomplished by [[bootstrap-and-self-update|accomplished-by]].
