<!--stratified-action
{
  "created": 1792790697,
  "edges": [
    {
      "dst": "req-failure-retry-escalation",
      "reason": "it escalates the cadence after failures and resets it after success",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-schedule-tick",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0180",
  "version": 1
}
-->

schedule_tick ensures directories, loads state, runs bin/macacfs update, sets weekly with zero failures on success or increments failures and picks nightly (or daily2pm from three failures) on failure, saves the state, rewrites the plist and reloads it from a detached nohup helper; a failed rewrite makes it return 1. Within the flow it [[lf-schedule-tick|serves|schedule_tick is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-schedule|serves|schedule_tick is defined in lib/schedule.sh.]], and its code is [[fb-lib-schedule-impl|accomplished-by|The concrete code of schedule_tick lives in the lib/schedule.sh implementation.]]. It [[fn-sched-ensure-dirs|calls|Directories first.]]; it [[fn-state-load|calls|Reads previous failures.]]; it [[fn-state-save|calls|Records this run.]]; it [[fn-schedule-write-plist|calls|Re-renders for the new cadence.]]; it [[fn-main|calls|It re-runs bin/macacfs update as a child process.]].
