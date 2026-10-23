<!--stratified-action
{
  "created": 1792790762,
  "edges": [
    {
      "dst": "req-scheduled-run-tracking",
      "reason": "the user can see the recorded state of scheduled runs",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-schedule-status-uninstall",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0218",
  "version": 1
}
-->

Schedule status and uninstall: schedule_status loads the state file and prints whether launchctl lists the job, the cadence, last run, last status, consecutive failures and plist path; schedule_uninstall unloads the job (ignoring errors), deletes the plist and confirms. This flow [[fb-lib-schedule|serves|The flow is realized by code in lib/schedule.sh.]]. It is carried out step by step by [[fn-state-load|accomplished-by|state_load performs part of this flow.]], [[fn-schedule-uninstall|accomplished-by|schedule_uninstall performs part of this flow.]], [[fn-schedule-status|accomplished-by|schedule_status performs part of this flow.]].
