<!--stratified-action
{
  "created": 1789594982,
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
  "realized_at": "0.14.0",
  "realized_fp": "1789594696:4685",
  "status": "drafting",
  "stratum": "implementation",
  "succeeds": "fb-lib-schedule-impl@v1",
  "uid": "n0054",
  "version": 2
}
-->

Implementation of fb-lib-schedule: `lib/schedule.sh` — state_load/state_save, cadence_calendar, schedule_path ($HOME/.local/bin, brew prefix bin/sbin, ~/.cargo/bin, ~/go/bin, then system dirs; fails loud if brew is absent), schedule_write_plist (substitutes __PATH__ and the calendar), schedule_install/uninstall/status, and schedule_tick, which runs 'macacfs update', records the outcome and cadence, rewrites the plist, and reloads it from a nohup'd helper (sleep 5; unload; load) because an inline unload kills the running tick before load. A failed plist rewrite is reported and fails the tick.
