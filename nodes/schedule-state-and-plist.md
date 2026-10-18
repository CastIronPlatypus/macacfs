<!--stratified-action
{
  "created": 1789593935,
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
      "dst": "launchd-scheduler-state",
      "reason": "The scheduler capability is realized by the state file, cadence calc, and plist writer.",
      "type": "serves"
    },
    {
      "dst": "scheduler-code",
      "reason": "The scheduling subsystem is realized by the scheduler code.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-scheduled-run-tracking",
      "reason": "Its state file with last-run time, status, and consecutive_failures plus read/write helpers is the persisted record the run-tracking requirement needs.",
      "type": "validated-by"
    },
    {
      "dst": "req-failure-retry-escalation",
      "reason": "The cadence calculator and state file's consecutive-failure count are what implement fail->nightly, 3 fails->2pm daily, success->weekly.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "schedule-state-and-plist",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0027",
  "version": 1
}
-->

A state file under the XDG state dir (last-run time, status, consecutive failures, cadence) with load/save helpers; a cadence calculator mapping a run's outcome to the next cadence (weekly Sunday 03:00 on success, nightly 03:00 after a failure, daily 14:00 once 3+ consecutive runs have failed) and its StartCalendarInterval block; a plist writer that renders the template with the label, program, log paths and a baked toolchain PATH; and launchctl load/unload, with the per-tick reload done from a detached helper so the job is never left unloaded. It [[launchd-scheduler-state|serves|The scheduler capability is realized by this state file, cadence calculation, and plist writer.]] and is [[scheduler-code|accomplished-by|The scheduling subsystem is realized by the scheduler code in lib/schedule.sh.]]. It [[isolated-runner-reporter|couples-with|Each tick's cadence is decided solely by the exit status of the full 'macacfs update', i.e. the reporter's aggregate exit; any change to how failures roll up changes the escalation.]] and [[prereq-autoinstaller|couples-with|The baked PATH exists so the prereq gate, running under launchd, can see brew, cargo and go and not reinstall them every tick.]]
