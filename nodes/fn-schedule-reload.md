<!--stratified-action
{
  "created": 1792790695,
  "edges": [],
  "is_bead": false,
  "name": "fn-schedule-reload",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0176",
  "version": 1
}
-->

schedule_reload unloads the plist with launchctl (ignoring errors) and loads it again with -w. Within the flow it [[lf-schedule-install|serves|schedule_reload is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-schedule|serves|schedule_reload is defined in lib/schedule.sh.]], and its code is [[fb-lib-schedule-impl|accomplished-by|The concrete code of schedule_reload lives in the lib/schedule.sh implementation.]].
