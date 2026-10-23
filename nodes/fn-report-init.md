<!--stratified-action
{
  "created": 1792790690,
  "edges": [],
  "is_bead": false,
  "name": "fn-report-init",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0166",
  "version": 1
}
-->

report_init empties the parallel _R_ABBR, _R_STATUS and _R_MSG arrays. Within the flow it [[lf-isolated-run-report|serves|report_init is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-report|serves|report_init is defined in lib/report.sh.]], and its code is [[fb-lib-report-impl|accomplished-by|The concrete code of report_init lives in the lib/report.sh implementation.]].
