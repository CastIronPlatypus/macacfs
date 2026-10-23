<!--stratified-action
{
  "created": 1792790675,
  "edges": [],
  "is_bead": false,
  "name": "fn-catalog-rows",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0131",
  "version": 1
}
-->

catalog_rows prints the manifest's rows with comment and blank lines removed. Within the flow it [[lf-catalog-selection|serves|catalog_rows is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-catalog|serves|catalog_rows is defined in lib/catalog.sh.]], and its code is [[fb-lib-catalog-impl|accomplished-by|The concrete code of catalog_rows lives in the lib/catalog.sh implementation.]].
