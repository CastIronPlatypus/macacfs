<!--stratified-action
{
  "created": 1792790679,
  "edges": [],
  "is_bead": false,
  "name": "fn-catalog-count",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0141",
  "version": 1
}
-->

catalog_count prints the number of real rows in the manifest. Within the flow it [[lf-catalog-selection|serves|catalog_count is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-catalog|serves|catalog_count is defined in lib/catalog.sh.]], and its code is [[fb-lib-catalog-impl|accomplished-by|The concrete code of catalog_count lives in the lib/catalog.sh implementation.]]. It [[fn-catalog-rows|calls|It counts the cleaned rows.]].
