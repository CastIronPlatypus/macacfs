<!--stratified-action
{
  "created": 1792790675,
  "edges": [],
  "is_bead": false,
  "name": "fn-catalog-all-abbrs",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0132",
  "version": 1
}
-->

catalog_all_abbrs prints the first (abbreviation) column of every row, in manifest order. Within the flow it [[lf-catalog-selection|serves|catalog_all_abbrs is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-catalog|serves|catalog_all_abbrs is defined in lib/catalog.sh.]], and its code is [[fb-lib-catalog-impl|accomplished-by|The concrete code of catalog_all_abbrs lives in the lib/catalog.sh implementation.]]. It [[fn-catalog-rows|calls|It reads the cleaned rows.]].
