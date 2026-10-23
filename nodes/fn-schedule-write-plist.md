<!--stratified-action
{
  "created": 1792790694,
  "edges": [
    {
      "dst": "req-weekly-update-launchagent",
      "reason": "it writes the LaunchAgent definition",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-schedule-write-plist",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0174",
  "version": 1
}
-->

schedule_write_plist <cadence> ensures directories, gets the PATH to bake in, gets the calendar block (failing on a bad cadence), and rewrites the plist from the template line by line, splicing the calendar at __CALENDAR__ and substituting __PROGRAM__, __LABEL__, __STDOUT__, __STDERR__ and __PATH__. Within the flow it [[lf-plist-render|serves|schedule_write_plist is one of the functions that carries out this flow.]], and [[lf-schedule-install|serves|schedule_write_plist is one of the functions that carries out this flow.]], and [[lf-schedule-tick|serves|schedule_write_plist is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-schedule|serves|schedule_write_plist is defined in lib/schedule.sh.]], and its code is [[fb-lib-schedule-impl|accomplished-by|The concrete code of schedule_write_plist lives in the lib/schedule.sh implementation.]]. It [[fn-sched-ensure-dirs|calls|Directories first.]]; it [[fn-schedule-path|calls|The PATH launchd will run with.]]; it [[fn-cadence-calendar|calls|The calendar block for the cadence.]].
