<!--stratified-action
{
  "created": 1789594075,
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
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0038",
  "version": 1
}
-->

lib/catalog.sh — loads share/manifest.tsv, resolves all/named tool selections, exposes row fields. Bead.
