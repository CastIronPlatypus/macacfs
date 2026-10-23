<!--stratified-action
{
  "created": 1792790696,
  "edges": [],
  "is_bead": false,
  "name": "fn-schedule-uninstall",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0178",
  "version": 1
}
-->

schedule_uninstall unloads the LaunchAgent (ignoring errors), deletes the plist and prints what it removed. Within the flow it [[lf-schedule-status-uninstall|serves|schedule_uninstall is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-schedule|serves|schedule_uninstall is defined in lib/schedule.sh.]], and its code is [[fb-lib-schedule-impl|accomplished-by|The concrete code of schedule_uninstall lives in the lib/schedule.sh implementation.]].
