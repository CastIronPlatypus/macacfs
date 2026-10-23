<!--stratified-action
{
  "created": 1792790033,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "--plan/--apply/--guided",
      "type": "validated-by"
    },
    {
      "dst": "newproj-engine",
      "reason": "The engine's embedded Python realizes the reviewed bootstrap.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "reviewed-bootstrap",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0104",
  "version": 1
}
-->

The capability to print a deterministic JSON plan (files with hashes, commands, effects), apply exactly that plan with no-follow exclusive writes, an flock and a checkpoint that --resume continues, guide a human through the same plan interactively, optionally register with Agent Mail, and — when selected — add commit, GitHub publish and ru registration as checkpointed commands with network/push effects disclosed. It [[newproj-experience|serves|The reviewed bootstrap is the deterministic plan-then-apply mode of newproj.]]. It is accomplished by [[newproj-engine|accomplished-by|The engine's embedded Python realizes the reviewed bootstrap.]].
