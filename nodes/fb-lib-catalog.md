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
      "type": "accomplished-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-catalog",
  "node_type": "impl",
  "obligations": [
    "r-install-all"
  ],
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0038",
  "version": 1
}
-->

lib/catalog.sh — loads share/manifest.tsv, resolves all/named tool selections, exposes row fields. Bead.
