<!--stratified-action
{
  "created": 1792790678,
  "edges": [
    {
      "dst": "req-fail-loud",
      "reason": "unknown selectors are reported and fail the selection",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-catalog-select",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0140",
  "version": 1
}
-->

catalog_select [selectors...] prints every abbreviation when given none; otherwise prints the canonical abbreviation for each selector found, reports 'unknown tool' on stderr for each miss, and returns 1 if any missed. Within the flow it [[lf-catalog-selection|serves|catalog_select is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-catalog|serves|catalog_select is defined in lib/catalog.sh.]], and its code is [[fb-lib-catalog-impl|accomplished-by|The concrete code of catalog_select lives in the lib/catalog.sh implementation.]]. It [[fn-catalog-all-abbrs|calls|No selectors means all.]]; it [[fn-catalog-row|calls|Each selector is looked up.]]; it [[fn-row-abbr|calls|The matched row is reduced to its canonical abbreviation.]].
