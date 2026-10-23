<!--stratified-action
{
  "accept": "With --github a repo OWNER/NAME exists with origin set and main pushed; failure paths print a clear message and create nothing.",
  "created": 1792789942,
  "edges": [],
  "is_bead": false,
  "kind": "functional",
  "name": "req-newproj-github-optional",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0091",
  "version": 1
}
-->

newproj can optionally create a GitHub repo for the new project via the gh CLI under the authenticated account (--github[=private|public], bare means private; --no-github overrides), set origin, and push the initial commit; gh missing/unauthenticated/name-taken are detected before anything local is created.
