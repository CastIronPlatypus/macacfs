<!--stratified-action
{
  "created": 1792790694,
  "edges": [],
  "is_bead": false,
  "name": "fn-schedule-path",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0175",
  "version": 1
}
-->

schedule_path prints the current PATH when it contains brew's bin directory, and otherwise (or when brew is not found) explains that schedule must be run from the user's normal shell and returns 1. Within the flow it [[lf-plist-render|serves|schedule_path is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-schedule|serves|schedule_path is defined in lib/schedule.sh.]], and its code is [[fb-lib-schedule-impl|accomplished-by|The concrete code of schedule_path lives in the lib/schedule.sh implementation.]].
