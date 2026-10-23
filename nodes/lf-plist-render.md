<!--stratified-action
{
  "created": 1792790763,
  "edges": [
    {
      "dst": "req-weekly-update-launchagent",
      "reason": "the LaunchAgent's schedule and environment come from a rendered template",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-plist-render",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0220",
  "version": 1
}
-->

Plist rendering: schedule_write_plist ensures the state, log and LaunchAgents directories, captures the calling shell's PATH (refusing when brew's bin is not on it, since launchd's default PATH hides the toolchains), selects the StartCalendarInterval block for the cadence (weekly Sunday 03:00, nightly 03:00, daily2pm 14:00), and rewrites share/macacfs.plist.template line by line, splicing the calendar block at __CALENDAR__ and substituting __PROGRAM__, __LABEL__, __STDOUT__, __STDERR__ and __PATH__. This flow [[fb-lib-schedule|serves|The flow is realized by code in lib/schedule.sh.]]. It is carried out step by step by [[fn-sched-ensure-dirs|accomplished-by|_sched_ensure_dirs performs part of this flow.]], [[fn-cadence-calendar|accomplished-by|cadence_calendar performs part of this flow.]], [[fn-schedule-write-plist|accomplished-by|schedule_write_plist performs part of this flow.]], [[fn-schedule-path|accomplished-by|schedule_path performs part of this flow.]].
