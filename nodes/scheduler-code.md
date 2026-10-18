<!--stratified-action
{
  "created": 1789594032,
  "disc_stamp": {
    "disc-callout-distal": "1.0.0",
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
  "edges": [
    {
      "dst": "schedule-state-and-plist",
      "reason": "This code realizes the state+plist scheduling subsystem.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-schedule",
      "reason": "The scheduler lives in lib/schedule.sh.",
      "type": "accomplished-by"
    },
    {
      "dst": "fb-plist-template",
      "reason": "The scheduler renders the plist from the share/macacfs.plist.template asset, splicing in the cadence calendar and substituting its placeholders.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-scheduled-run-tracking",
      "reason": "The scheduler code unit's state read/write functions persist last-run and outcome after each tick, making the run history readable as required.",
      "type": "validated-by"
    },
    {
      "dst": "req-failure-retry-escalation",
      "reason": "schedule_tick increments consecutive failures and picks nightly or daily2pm (or weekly on success), rewriting the plist accordingly.",
      "type": "validated-by"
    },
    {
      "dst": "req-weekly-update-launchagent",
      "reason": "schedule_install writes ~/Library/LaunchAgents/com.macacfs.update.plist with a weekly default cadence and loads it via launchctl.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "scheduler-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0034",
  "version": 1
}
-->

Code unit: state_load/state_save for the state.env file; cadence_calendar emitting the StartCalendarInterval block for weekly, nightly or daily2pm; schedule_path building the LaunchAgent PATH from brew --prefix plus the cargo, go and local bin dirs; schedule_write_plist rendering the template line by line; schedule_install, schedule_uninstall and schedule_status; and schedule_tick, which runs 'macacfs update', saves the outcome with the new consecutive-failure count and cadence, rewrites the plist, and reloads it from a detached nohup helper (an inline unload would kill the tick itself). It [[schedule-state-and-plist|serves|This code realizes the state and plist scheduling subsystem.]] and is [[fb-lib-schedule|accomplished-by|The scheduler code lives in lib/schedule.sh.]] and [[fb-plist-template|accomplished-by|The scheduler renders the plist from the share/macacfs.plist.template asset, splicing in the cadence calendar and substituting its placeholders.]]. It [[argv-code|couples-with|The rendered plist runs bin/macacfs with the hidden '_tick' argument, which only works while argv-code keeps routing _tick to schedule_tick.]]
