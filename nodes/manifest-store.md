<!--stratified-action
{
  "created": 1789593934,
  "edges": [
    {
      "dst": "tool-catalog",
      "reason": "The catalog capability is backed by the on-disk manifest and its loader.",
      "type": "serves"
    },
    {
      "dst": "catalog-loader-code",
      "reason": "The manifest store is realized by the loader code (+ data).",
      "type": "accomplished-by"
    },
    {
      "dst": "req-install-whole-suite",
      "reason": "A repo-shipped TSV manifest with one row per tool plus a select-all loader gives install a complete enumeration of the 39 tools.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "manifest-store",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0023",
  "version": 1
}
-->

A plain-text manifest (one tab-separated row per tool: abbr, repo, cli, method, extra) shipped in the repo, plus a loader that reads it and lets callers select all rows or a named subset. Feeds [[tool-catalog|flow]]. Accomplished by [[catalog-loader-code|accomplished-by]].
