<!--stratified-action
{
  "created": 1792790692,
  "edges": [],
  "is_bead": false,
  "name": "fn-sched-ensure-dirs",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0170",
  "version": 1
}
-->

_sched_ensure_dirs creates the state directory, its logs directory and ~/Library/LaunchAgents. Within the flow it [[lf-plist-render|serves|_sched_ensure_dirs is one of the functions that carries out this flow.]], and [[lf-schedule-tick|serves|_sched_ensure_dirs is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-schedule|serves|_sched_ensure_dirs is defined in lib/schedule.sh.]], and its code is [[fb-lib-schedule-impl|accomplished-by|The concrete code of _sched_ensure_dirs lives in the lib/schedule.sh implementation.]].
