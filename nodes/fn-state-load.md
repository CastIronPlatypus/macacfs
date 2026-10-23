<!--stratified-action
{
  "created": 1792790692,
  "edges": [
    {
      "dst": "req-scheduled-run-tracking",
      "reason": "it reads the recorded run state",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-state-load",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0171",
  "version": 1
}
-->

state_load sets defaults (no last run, status never, zero failures, weekly cadence) and then sources the state file when it exists. Within the flow it [[lf-schedule-install|serves|state_load is one of the functions that carries out this flow.]], and [[lf-schedule-status-uninstall|serves|state_load is one of the functions that carries out this flow.]], and [[lf-schedule-tick|serves|state_load is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-schedule|serves|state_load is defined in lib/schedule.sh.]], and its code is [[fb-lib-schedule-impl|accomplished-by|The concrete code of state_load lives in the lib/schedule.sh implementation.]].
