<!--stratified-action
{
  "created": 1792790673,
  "edges": [
    {
      "dst": "req-install-whole-suite",
      "reason": "it is the shared install/update engine",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-run-tools",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "succeeds": "fn-run-tools@v2",
  "uid": "n0128",
  "version": 3
}
-->

run_tools <install|update> [selectors...] resolves selectors, collects the methods in play, runs the prerequisite check, then for each abbreviation either dispatches directly under dry-run (printing '[dry-run] post_install_<ABBR>' when the tool has a post-install hook, and recording the row) or runs install_and_verify_row inside run_isolated, and returns report_render's verdict. Within the flow it [[lf-tool-run-engine|serves|run_tools is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-bin-macacfs|serves|run_tools is defined in bin/macacfs.]], and its code is [[fb-bin-macacfs-impl|accomplished-by|The concrete code of run_tools lives in the bin/macacfs implementation.]]. It [[fn-catalog-select|calls|Selectors become abbreviations, failing loud on unknown ones.]]; it [[fn-catalog-row|calls|Each abbreviation is turned back into its manifest row.]]; it [[fn-row-method|calls|The row's method is collected for the prereq check and printed.]]; it [[fn-prereq-ensure|calls|Toolchains for the methods in play are ensured first.]]; it [[fn-report-init|calls|The summary is reset before the loop.]]; it [[fn-dispatch-row|calls|Under dry-run each row is dispatched directly.]]; it [[fn-report-add|calls|Under dry-run each row's result is recorded directly.]]; it [[fn-run-isolated|calls|Outside dry-run each row runs isolated.]]; it [[fn-install-and-verify-row|calls|The isolated command is install, verify signatures, audit the CLI path and run the post-install hook.]]; it [[fn-report-render|calls|The summary decides the return code.]].
