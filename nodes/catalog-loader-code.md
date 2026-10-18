<!--stratified-action
{
  "created": 1789594032,
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
    },
    {
      "dst": "req-install-whole-suite",
      "reason": "Loading every manifest row and offering select-all iteration is what lets 'macacfs install' reach all 39 suite tools rather than a hard-coded subset.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "catalog-loader-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0030",
  "version": 1
}
-->

Code unit that queries the tab-separated tool manifest on demand (no in-memory cache): catalog_rows strips comments and blanks, catalog_all_abbrs lists every abbr in manifest order, catalog_row matches a selector case-insensitively against the abbr or cli column, catalog_select resolves selectors to abbrs (empty means all; any unknown selector is reported on stderr and returns non-zero), catalog_count counts rows, and the positional row_abbr/row_repo/row_cli/row_method/row_ref/row_args accessors split a row (args '-' means none). It [[manifest-store|serves|This loader code realizes the manifest-store subsystem's select-all and select-named queries.]], is [[fb-lib-catalog|accomplished-by|The loader functions live in lib/catalog.sh.]], and is [[fb-manifest-tsv|accomplished-by|The loader's data is the share/manifest.tsv file whose six tab-separated columns the positional accessors index by number.]].
