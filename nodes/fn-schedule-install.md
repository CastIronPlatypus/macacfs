<!--stratified-action
{
  "created": 1792790695,
  "edges": [
    {
      "dst": "req-weekly-update-launchagent",
      "reason": "it installs and loads the update LaunchAgent",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-schedule-install",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0177",
  "version": 1
}
-->

schedule_install loads state, writes the plist for the saved cadence (default weekly), reloads it, and prints the label, cadence and plist path; it returns 1 on a render or load failure. Within the flow it [[lf-schedule-install|serves|schedule_install is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-schedule|serves|schedule_install is defined in lib/schedule.sh.]], and its code is [[fb-lib-schedule-impl|accomplished-by|The concrete code of schedule_install lives in the lib/schedule.sh implementation.]]. It [[fn-state-load|calls|Reads the saved cadence.]]; it [[fn-schedule-write-plist|calls|Renders the plist.]]; it [[fn-schedule-reload|calls|Loads it.]].
