<!--stratified-action
{
  "created": 1792790696,
  "edges": [
    {
      "dst": "req-scheduled-run-tracking",
      "reason": "it shows the recorded state of scheduled runs",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-schedule-status",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0179",
  "version": 1
}
-->

schedule_status loads state and prints the label, whether launchctl lists it (captured then tested to avoid a pipefail false negative), cadence, last run, last status, consecutive failures and plist path. Within the flow it [[lf-schedule-status-uninstall|serves|schedule_status is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-schedule|serves|schedule_status is defined in lib/schedule.sh.]], and its code is [[fb-lib-schedule-impl|accomplished-by|The concrete code of schedule_status lives in the lib/schedule.sh implementation.]]. It [[fn-state-load|calls|Reads the recorded state.]].
