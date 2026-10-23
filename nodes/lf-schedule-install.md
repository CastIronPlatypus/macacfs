<!--stratified-action
{
  "created": 1792790761,
  "edges": [
    {
      "dst": "req-weekly-update-launchagent",
      "reason": "the update LaunchAgent is installed and loaded on request",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-schedule-install",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0217",
  "version": 1
}
-->

Schedule install: schedule_install loads the saved run state, renders the plist for the saved cadence (weekly when none), unloads and reloads it with launchctl, and prints the label, cadence and plist path; any render or load failure is fatal. This flow [[fb-lib-schedule|serves|The flow is realized by code in lib/schedule.sh.]]. It is carried out step by step by [[fn-state-load|accomplished-by|state_load performs part of this flow.]], [[fn-schedule-write-plist|accomplished-by|schedule_write_plist performs part of this flow.]], [[fn-schedule-reload|accomplished-by|schedule_reload performs part of this flow.]], [[fn-schedule-install|accomplished-by|schedule_install performs part of this flow.]]. Related flows: [[lf-plist-render|flow|Rendering the plist is the core step.]].
