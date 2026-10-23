<!--stratified-action
{
  "created": 1792790754,
  "edges": [
    {
      "dst": "req-fail-loud",
      "reason": "an unknown tool selector is reported on stderr and fails the run",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-catalog-selection",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0202",
  "version": 1
}
-->

Catalog selection: manifest.tsv rows are read with comments and blank lines stripped; an empty selector list means every abbreviation in manifest order, otherwise each selector is matched case-insensitively against the abbreviation or CLI column and turned into its canonical abbreviation, with every miss printed to stderr and the whole selection returning non-zero; callers then fetch the raw row per abbreviation and unpack its tab-separated fields (abbr, repo, cli, method, ref, args, with '-' meaning no args) through the row accessors. This flow [[fb-lib-catalog|serves|The flow is realized by code in lib/catalog.sh.]]. It is carried out step by step by [[fn-catalog-rows|accomplished-by|catalog_rows performs part of this flow.]], [[fn-catalog-all-abbrs|accomplished-by|catalog_all_abbrs performs part of this flow.]], [[fn-catalog-row|accomplished-by|catalog_row performs part of this flow.]], [[fn-row-abbr|accomplished-by|row_abbr performs part of this flow.]], [[fn-row-repo|accomplished-by|row_repo performs part of this flow.]], [[fn-row-cli|accomplished-by|row_cli performs part of this flow.]], [[fn-row-method|accomplished-by|row_method performs part of this flow.]], [[fn-row-ref|accomplished-by|row_ref performs part of this flow.]], [[fn-row-args|accomplished-by|row_args performs part of this flow.]], [[fn-catalog-select|accomplished-by|catalog_select performs part of this flow.]], [[fn-catalog-count|accomplished-by|catalog_count performs part of this flow.]]. Related flows: [[lf-method-dispatch|flow|Rows and their accessor-unpacked fields feed dispatch_row.]].
