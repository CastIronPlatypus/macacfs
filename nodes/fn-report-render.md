<!--stratified-action
{
  "created": 1792790691,
  "edges": [
    {
      "dst": "req-fail-loud",
      "reason": "the summary lists every failure and sets a non-zero result",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-report-render",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0169",
  "version": 1
}
-->

report_render prints the summary table, one line per recorded step marked ok, skipped (with reason) or failed (with message), then the ok/skipped/failed/total counts, and returns non-zero if any step failed. Within the flow it [[lf-isolated-run-report|serves|report_render is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-report|serves|report_render is defined in lib/report.sh.]], and its code is [[fb-lib-report-impl|accomplished-by|The concrete code of report_render lives in the lib/report.sh implementation.]].
