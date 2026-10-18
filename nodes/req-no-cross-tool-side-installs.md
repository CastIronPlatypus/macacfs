<!--stratified-action
{
  "accept": "After installing BRENNER, no ntm/cass/cm binaries are written into ~/.local/bin by brenner's installer; cm and ntm resolve to their Homebrew installs.",
  "created": 1792285850,
  "edges": [],
  "is_bead": false,
  "kind": "constraint",
  "name": "req-no-cross-tool-side-installs",
  "node_type": "requirement",
  "status": "drafting",
  "stratum": "intent",
  "uid": "n0085",
  "version": 1
}
-->

A tool's own installer must not install other suite tools outside their catalogued method; where an installer bundles pinned copies of other suite tools, macacfs passes its skip flags so each tool comes only from its own catalogue row.
