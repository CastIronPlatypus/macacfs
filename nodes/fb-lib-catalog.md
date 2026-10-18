<!--stratified-action
{
  "created": 1789594075,
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
      "dst": "catalog-loader-code",
      "reason": "This file realizes the catalog loader.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-catalog-impl",
      "reason": "The catalog bead is realized by lib/catalog.sh, the shell code that parses share/manifest.tsv and resolves all or named tool selections.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-install-whole-suite",
      "reason": "lib/catalog.sh resolves an 'all' selection to every manifest row, which is how a bare 'macacfs install' covers the whole 39-tool suite.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-catalog",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0038",
  "version": 1
}
-->

The lib/catalog.sh file boundary: the sourced library that queries share/manifest.tsv (path from MACACFS_MANIFEST), resolves all or named tool selections case-insensitively by abbr or cli, and exposes positional row-field accessors and the catalog count. It [[catalog-loader-code|serves|This file holds the catalog loader code unit.]] and is [[fb-lib-catalog-impl|accomplished-by|The lib/catalog.sh shell code parses share/manifest.tsv and resolves all or named tool selections.]]. Its accessors [[fb-manifest-tsv|couples-with|row_abbr..row_args read fixed awk columns 1-6, so this file and the manifest's tab-separated column order must change together.]].
