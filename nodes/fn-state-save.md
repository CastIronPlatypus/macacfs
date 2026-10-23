<!--stratified-action
{
  "created": 1792790693,
  "edges": [
    {
      "dst": "req-scheduled-run-tracking",
      "reason": "it records each scheduled run's outcome",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-state-save",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0172",
  "version": 1
}
-->

state_save <time> <status> <fails> <cadence> writes MACACFS_LAST_RUN, MACACFS_LAST_STATUS, MACACFS_CONSEC_FAILS and MACACFS_CADENCE to the state file. Within the flow it [[lf-schedule-tick|serves|state_save is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-schedule|serves|state_save is defined in lib/schedule.sh.]], and its code is [[fb-lib-schedule-impl|accomplished-by|The concrete code of state_save lives in the lib/schedule.sh implementation.]]. It [[fn-sched-ensure-dirs|calls|The state directory must exist.]].
