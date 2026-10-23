<!--stratified-action
{
  "created": 1792790691,
  "edges": [
    {
      "dst": "req-fail-loud",
      "reason": "a failure is captured and recorded, never swallowed or fatal to the batch",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-run-isolated",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0168",
  "version": 1
}
-->

run_isolated <abbr> <label> <cmd...> prints the step, resets RUN_NOTE and RUN_STATUS, runs the command with output captured to a temp log, records ok (or RUN_STATUS) plus RUN_NOTE on success or 'fail' plus the last three non-blank log lines on failure (echoing it to stderr), deletes the log and returns the command's code. Within the flow it [[lf-isolated-run-report|serves|run_isolated is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-report|serves|run_isolated is defined in lib/report.sh.]], and its code is [[fb-lib-report-impl|accomplished-by|The concrete code of run_isolated lives in the lib/report.sh implementation.]]. It [[fn-report-add|calls|Every outcome is recorded.]].
