<!--stratified-action
{
  "created": 1789593709,
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
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0009",
  "version": 1
}
-->

macacfs must self-update via a bootstrap flag (the ACFS pattern): fetch the repo and reinstall itself. It needs its own canonical repo URL and an atomic replace of the running script; this also enables the one-liner install. Accomplished by [[bootstrap-and-self-update|accomplished-by]].
