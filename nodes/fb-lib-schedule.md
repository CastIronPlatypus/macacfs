<!--stratified-action
{
  "created": 1789594077,
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
      "dst": "scheduler-code",
      "reason": "This file realizes the scheduler code.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-schedule-impl",
      "reason": "The scheduling bead is realized by lib/schedule.sh, holding state I/O, cadence calculation, plist writing, and the LaunchAgent tick entrypoint.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-scheduled-run-tracking",
      "reason": "lib/schedule.sh reads and writes the state file holding last-run time and status, which is the recorded run history the requirement asks for.",
      "type": "validated-by"
    },
    {
      "dst": "req-failure-retry-escalation",
      "reason": "lib/schedule.sh tracks consecutive failures and computes weekly, nightly, or 2pm cadence from them, implementing the retry-then-escalate schedule.",
      "type": "validated-by"
    },
    {
      "dst": "req-weekly-update-launchagent",
      "reason": "lib/schedule.sh writes the LaunchAgent plist and reloads it via launchctl with a weekly default cadence, installing the required weekly updater.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-schedule",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "succeeds": "fb-lib-schedule@v1",
  "uid": "n0043",
  "version": 2
}
-->

The lib/schedule.sh file boundary: run-state read/write (last run, status, consecutive failures, cadence), cadence calculation (weekly, nightly, or daily 2pm after 3+ consecutive failures), the plist renderer that bakes in the toolchain PATH, launchctl install/uninstall/status, and the _tick entrypoint the LaunchAgent fires, which reloads its own job only from a detached helper so the agent stays loaded. It [[scheduler-code|serves|This file holds the scheduler code unit.]] and is [[fb-lib-schedule-impl|accomplished-by|lib/schedule.sh holds state I/O, cadence calculation, plist writing, and the LaunchAgent tick entrypoint.]]. Its renderer [[fb-plist-template|couples-with|schedule_write_plist substitutes the exact placeholder tokens written in share/macacfs.plist.template, so the two files must agree on every token name.]], and the PATH it bakes [[fb-bin-macacfs|couples-with|The launchd PATH from schedule_path must make brew, cargo and go visible to the bin/macacfs tick, whose shebang is pinned to Homebrew bash because launchd's bare PATH once resolved bash 3.2.]].
