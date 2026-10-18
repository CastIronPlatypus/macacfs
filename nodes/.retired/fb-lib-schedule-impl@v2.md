<!--stratified-action
{
  "created": 1789594982,
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
      "dst": "fb-lib-schedule",
      "reason": "The lib/schedule.sh source file is the implementation that fulfills the scheduler bead.",
      "type": "serves"
    }
  ],
  "impl_path": "lib/schedule.sh",
  "is_bead": true,
  "name": "fb-lib-schedule-impl",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "realized_fp": "1789594696:4685",
  "retire_reason": "A fixed PATH list left out nvm's node, so the scheduled run brew-installed a duplicate node; schedule_path now bakes in the PATH of the shell running macacfs schedule, failing loud if Homebrew's bin is not on it.",
  "retired_at": 1792289630,
  "status": "retired",
  "stratum": "implementation",
  "succeeds": "fb-lib-schedule-impl@v1",
  "uid": "n0054",
  "version": 2
}
-->

Implementation of lib/schedule.sh; it [[fb-lib-schedule|serves|The lib/schedule.sh source file is the implementation that fulfills the scheduler bead.]]. It defines LABEL com.macacfs.update, the plist under ~/Library/LaunchAgents, and state at ${XDG_STATE_HOME:-~/.local/state}/macacfs/state.env with logs alongside; state_load/state_save (last run, status, consecutive failures, cadence); cadence_calendar (weekly Sunday 03:00, nightly 03:00, daily2pm 14:00 StartCalendarInterval blocks); schedule_path (~/.local/bin, brew prefix bin/sbin, ~/.cargo/bin, ~/go/bin, then system dirs; fails loud if brew is absent); schedule_write_plist, which renders the template line by line, splicing the calendar block at __CALENDAR__ and substituting __PROGRAM__, __LABEL__, __STDOUT__, __STDERR__ and __PATH__; schedule_install/uninstall/status; and schedule_tick, which runs 'macacfs update', resets failures to 0 and cadence to weekly on success or increments failures (nightly, or daily2pm at 3+) on failure, saves state, rewrites the plist, and reloads it from a nohup'd helper (sleep 5; unload; load) because an inline unload kills the running tick before load. A failed plist rewrite is reported and fails the tick. Its placeholder substitution [[fb-plist-template-impl|couples-with|The __CALENDAR__/__PROGRAM__/__LABEL__/__STDOUT__/__STDERR__/__PATH__ tokens substituted here must exactly match the placeholders written in share/macacfs.plist.template, and the detached reload relies on the template's AbandonProcessGroup key.]].
