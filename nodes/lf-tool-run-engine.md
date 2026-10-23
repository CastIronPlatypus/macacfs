<!--stratified-action
{
  "created": 1792790753,
  "edges": [
    {
      "dst": "req-install-whole-suite",
      "reason": "one engine installs or updates the whole catalog, or a named subset",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-tool-run-engine",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0201",
  "version": 1
}
-->

Tool-run engine: run_tools <install|update> resolves the selectors to abbreviations (failing loud on any unknown one), gathers each row's method, asks the prerequisite check for the toolchains those methods need, then initialises the report and walks the rows in manifest order; under dry-run it prints and dispatches each row and records the result directly, otherwise it runs install_and_verify_row for each row inside run_isolated so one failure never stops the batch; finally report_render prints the summary and supplies the return code. Install and update share this path because every method installs the latest. This flow [[fb-bin-macacfs|serves|The flow is realized by code in bin/macacfs.]]. It is carried out step by step by [[fn-run-tools|accomplished-by|run_tools performs part of this flow.]]. Related flows: [[lf-catalog-selection|flow|First step: selectors become abbreviations and rows.]]; [[lf-prereq-ensure|flow|Second step: the set of methods drives the toolchain check.]]; [[lf-isolated-run-report|flow|Each row runs inside run_isolated and lands in the summary.]]; [[lf-codesign-verify-repair|flow|Outside dry-run each row is installed via install_and_verify_row.]]; [[lf-method-dispatch|flow|Under dry-run each row goes straight to dispatch_row.]].
