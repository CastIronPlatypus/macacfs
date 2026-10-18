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
  "retire_reason": "lib/schedule.sh adds schedule_path (substituted for __PATH__), a detached post-tick reload, and a loud error instead of '|| true' when the plist rewrite fails.",
  "retired_at": 1792285883,
  "status": "retired",
  "stratum": "implementation",
  "uid": "n0054",
  "version": 1
}
-->

Implementation of fb-lib-schedule: `lib/schedule.sh`
