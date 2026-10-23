<!--stratified-action
{
  "created": 1792790674,
  "edges": [],
  "is_bead": false,
  "name": "fn-main",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0130",
  "version": 1
}
-->

main <command> [args...] routes the command (default help): install and update parse dry-run, call run_tools and, with no selectors, shell_run install or refresh, exiting with the combined code; self-update sets DRY_RUN and calls selfupdate_run; schedule maps --install (default), --uninstall and --status, exiting 2 on others; _tick calls schedule_tick; list prints the catalog; version and help print text; unknown commands print usage and exit 2. Every mutating branch first calls require_darwin. Within the flow it [[lf-cli-dispatch|serves|main is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-bin-macacfs|serves|main is defined in bin/macacfs.]], and its code is [[fb-bin-macacfs-impl|accomplished-by|The concrete code of main lives in the bin/macacfs implementation.]]. It [[fn-require-darwin|calls|Mutating commands are gated to macOS.]]; it [[fn-parse-dry-run|calls|install and update split --dry-run from selectors.]]; it [[fn-run-tools|calls|install and update run the tool engine.]]; it [[fn-shell-run|calls|A full install or update also sets up or refreshes the shell.]]; it [[fn-selfupdate-run|calls|self-update.]]; it [[fn-schedule-install|calls|schedule --install.]]; it [[fn-schedule-uninstall|calls|schedule --uninstall.]]; it [[fn-schedule-status|calls|schedule --status.]]; it [[fn-schedule-tick|calls|_tick.]]; it [[fn-catalog-rows|calls|list formats the catalog rows.]]; it [[fn-usage|calls|help and unknown commands.]].
