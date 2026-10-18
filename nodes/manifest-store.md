<!--stratified-action
{
  "created": 1789593934,
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
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0023",
  "version": 1
}
-->

The manifest-store subsystem: a plain-text manifest shipped in the repo at share/manifest.tsv (one tab-separated row per tool: abbr, repo, cli, method, ref, args, with comment lines ignored), plus a loader that queries it on demand and lets callers select all rows or a named subset by abbr or cli name, case-insensitively, and read each row's fields. It [[tool-catalog|serves|The tool-catalog capability is backed by this on-disk manifest and its loader.]] and is [[catalog-loader-code|accomplished-by|The catalog loader code in lib/catalog.sh, reading the manifest data, realizes this subsystem.]].
