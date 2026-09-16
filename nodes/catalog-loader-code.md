<!--stratified-action
{
  "created": 1789594032,
  "edges": [
    {
      "dst": "manifest-store",
      "reason": "The loader code realizes the manifest-store subsystem.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-catalog",
      "reason": "The loader code lives in lib/catalog.sh.",
      "type": "accomplished-by"
    },
    {
      "dst": "fb-manifest-tsv",
      "reason": "The loader reads the manifest data file.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "catalog-loader-code",
  "node_type": "impl",
  "obligations": [
    "r-install-all"
  ],
  "status": "drafting",
  "stratum": "components",
  "uid": "n0030",
  "version": 1
}
-->

Code unit that loads the tab-separated manifest into memory and exposes select-all / select-named row iteration. Realizes [[manifest-store|flow]]. Accomplished by [[fb-lib-catalog|accomplished-by]] and [[fb-manifest-tsv|accomplished-by]].
