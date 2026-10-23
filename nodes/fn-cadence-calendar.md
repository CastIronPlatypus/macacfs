<!--stratified-action
{
  "created": 1792790693,
  "edges": [
    {
      "dst": "req-failure-retry-escalation",
      "reason": "it maps each cadence to its launchd calendar",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-cadence-calendar",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0173",
  "version": 1
}
-->

cadence_calendar <weekly|nightly|daily2pm> prints the StartCalendarInterval plist block (Sunday 03:00, daily 03:00, daily 14:00) and returns 1 for any other cadence. Within the flow it [[lf-plist-render|serves|cadence_calendar is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-schedule|serves|cadence_calendar is defined in lib/schedule.sh.]], and its code is [[fb-lib-schedule-impl|accomplished-by|The concrete code of cadence_calendar lives in the lib/schedule.sh implementation.]].
