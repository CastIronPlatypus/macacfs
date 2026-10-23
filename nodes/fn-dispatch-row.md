<!--stratified-action
{
  "created": 1792790684,
  "edges": [
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "it selects the install function from the row's method",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-dispatch-row",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0153",
  "version": 1
}
-->

dispatch_row <row> unpacks the row, resets HOOK_ENV and HOOK_EXTRA_ARGS, runs pre_install_<ABBR> when defined for a non-skip row (announcing it only under dry-run, returning its code on failure), then calls do_skip, do_brew, do_installer_sh (row args plus hook args), do_cargo_git or do_go per the method, returning 2 for an unknown method. Within the flow it [[lf-method-dispatch|serves|dispatch_row is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-methods|serves|dispatch_row is defined in lib/methods.sh.]], and its code is [[fb-lib-methods-impl|accomplished-by|The concrete code of dispatch_row lives in the lib/methods.sh implementation.]]. It [[fn-row-abbr|calls|Unpacks the abbreviation.]]; it [[fn-row-method|calls|Unpacks the method.]]; it [[fn-row-repo|calls|Unpacks the repo.]]; it [[fn-row-ref|calls|Unpacks the ref.]]; it [[fn-row-args|calls|Unpacks the args.]]; it [[fn-pre-install-mdwb|calls|The MDWB row's hook is found by name.]]; it [[fn-do-skip|calls|method skip.]]; it [[fn-do-brew|calls|method brew.]]; it [[fn-do-installer-sh|calls|method installer-sh.]]; it [[fn-do-cargo-git|calls|method cargo-git.]]; it [[fn-do-go|calls|method go.]].
