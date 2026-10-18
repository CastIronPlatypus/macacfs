<!--stratified-action
{
  "accept": "Each commit after 0.3.0 changes VERSION to the previous value with its last number plus one; 'macacfs version' on a fresh install from GitHub prints the VERSION of main's head commit.",
  "created": 1792289651,
  "edges": [],
  "is_bead": false,
  "kind": "constraint",
  "name": "req-version-bump-per-commit",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0088",
  "version": 1
}
-->

The patch number in VERSION increments by one on every commit to macacfs (0.3.0, 0.3.1, 0.3.2, ...), so the installed version always identifies the commit it came from.
