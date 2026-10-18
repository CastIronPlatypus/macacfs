<!--stratified-action
{
  "created": 1789594981,
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
      "dst": "fb-lib-catalog",
      "reason": "The lib/catalog.sh source file is the implementation that fulfills the catalog-loader bead's responsibilities.",
      "type": "serves"
    }
  ],
  "impl_path": "lib/catalog.sh",
  "is_bead": true,
  "name": "fb-lib-catalog-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": "1789594579:1905",
  "status": "drafting",
  "stratum": "implementation",
  "uid": "n0049",
  "version": 1
}
-->

Implementation of lib/catalog.sh; it [[fb-lib-catalog|serves|The lib/catalog.sh source file is the implementation that fulfills the catalog-loader bead's responsibilities.]]. It aborts at source time unless MACACFS_MANIFEST is set, and defines catalog_rows (grep out comment/blank lines), catalog_all_abbrs, catalog_row (case-insensitive match on abbr column 1 or cli column 3 via awk, non-zero if absent), the positional accessors row_abbr/row_repo/row_cli/row_method/row_ref/row_args (columns 1-6, args '-' mapped to empty), catalog_select (empty means all; unknown selectors reported as 'macacfs: unknown tool' with non-zero return) and catalog_count. The accessor column numbers [[fb-manifest-tsv-impl|couples-with|The awk field indexes here must match the abbr/repo/cli/method/ref/args column order of share/manifest.tsv; reordering or inserting a column there silently mis-reads every row.]].
