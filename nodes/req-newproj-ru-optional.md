<!--stratified-action
{
  "accept": "With --ru the repo appears in ru list; failures are reported without deleting anything.",
  "created": 1792789943,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "name": "req-newproj-ru-optional",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0092",
  "version": 1
}
-->

newproj can optionally register the project's GitHub repo with ru (ru add --from-cwd, --private for private repos) via --ru / --no-ru; ru missing or no GitHub remote is detected before creation.
