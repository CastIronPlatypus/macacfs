<!--stratified-action
{
  "created": 1792790674,
  "edges": [
    {
      "dst": "req-dry-run-no-side-effects",
      "reason": "it is where --dry-run becomes the DRY_RUN global",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-parse-dry-run",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0129",
  "version": 1
}
-->

parse_dry_run [args...] sets DRY_RUN=0, moves every non --dry-run argument into the SELECTORS array, sets DRY_RUN=1 if --dry-run appeared anywhere, and exports DRY_RUN. Within the flow it [[lf-cli-dispatch|serves|parse_dry_run is one of the functions that carries out this flow.]], and [[lf-dry-run-propagation|serves|parse_dry_run is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-bin-macacfs|serves|parse_dry_run is defined in bin/macacfs.]], and its code is [[fb-bin-macacfs-impl|accomplished-by|The concrete code of parse_dry_run lives in the bin/macacfs implementation.]].
