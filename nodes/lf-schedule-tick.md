<!--stratified-action
{
  "created": 1792790762,
  "edges": [
    {
      "dst": "req-failure-retry-escalation",
      "reason": "a failed scheduled run tightens the cadence until it succeeds",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-schedule-tick",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0219",
  "version": 1
}
-->

Scheduled tick: launchd fires macacfs _tick, and schedule_tick loads the state, runs a full 'macacfs update' as a child process, then computes the outcome: success resets consecutive failures and returns to weekly, a failure increments them and moves to nightly, three or more to daily at 14:00; it saves the state, re-renders the plist for that cadence, and reloads the job from a detached helper (sleep then unload/load) because unloading inline would kill the tick itself; a failed re-render turns the tick into a failure. This flow [[fb-lib-schedule|serves|The flow is realized by code in lib/schedule.sh.]]. It is carried out step by step by [[fn-sched-ensure-dirs|accomplished-by|_sched_ensure_dirs performs part of this flow.]], [[fn-state-load|accomplished-by|state_load performs part of this flow.]], [[fn-state-save|accomplished-by|state_save performs part of this flow.]], [[fn-schedule-write-plist|accomplished-by|schedule_write_plist performs part of this flow.]], [[fn-schedule-tick|accomplished-by|schedule_tick performs part of this flow.]]. Related flows: [[lf-cli-dispatch|flow|The tick re-enters bin/macacfs as 'update', which is a full tool run plus shell refresh.]]; [[lf-plist-render|flow|The new cadence is written into the plist.]].
