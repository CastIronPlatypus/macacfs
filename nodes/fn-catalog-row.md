<!--stratified-action
{
  "created": 1792790675,
  "edges": [],
  "is_bead": false,
  "name": "fn-catalog-row",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0133",
  "version": 1
}
-->

catalog_row <selector> lower-cases the selector and prints the first row whose abbreviation or CLI column matches it case-insensitively, returning non-zero when none does. Within the flow it [[lf-catalog-selection|serves|catalog_row is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-catalog|serves|catalog_row is defined in lib/catalog.sh.]], and its code is [[fb-lib-catalog-impl|accomplished-by|The concrete code of catalog_row lives in the lib/catalog.sh implementation.]]. It [[fn-catalog-rows|calls|It searches the cleaned rows.]].
