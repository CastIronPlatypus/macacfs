<!--stratified-action
{
  "created": 1792790759,
  "edges": [
    {
      "dst": "req-fail-loud",
      "reason": "no step failure aborts the batch or goes unreported",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-isolated-run-report",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0212",
  "version": 1
}
-->

Isolated run and summary: run_isolated prints the step, resets RUN_STATUS and RUN_NOTE, runs the command with all output captured to a temp log, and records ok (or the step's own RUN_STATUS such as skip) with its note on success, or 'fail' with the last three non-blank log lines (or 'exit N (no output)') on failure, echoing the failure to stderr; report_render then prints one line per step with ok, skipped or failed markers and the counts, returning non-zero only if something failed. This flow [[fb-lib-report|serves|The flow is realized by code in lib/report.sh.]]. It is carried out step by step by [[fn-report-init|accomplished-by|report_init performs part of this flow.]], [[fn-report-add|accomplished-by|report_add performs part of this flow.]], [[fn-run-isolated|accomplished-by|run_isolated performs part of this flow.]], [[fn-report-render|accomplished-by|report_render performs part of this flow.]].
