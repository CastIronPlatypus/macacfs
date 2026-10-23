<!--stratified-action
{
  "created": 1792790003,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "reviewed plans must disclose push/network",
      "type": "validated-by"
    },
    {
      "dst": "req-newproj-ru-optional",
      "reason": "ru-add appears in the plan",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "plan-review-covers-remote-effects",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0100",
  "version": 1
}
-->

The acfs reviewed bootstrap promises the reviewed JSON plan lists every effect and records effects.push=false and network=false. Adding GitHub publishing and ru registration introduces a commit, network calls and a push. Those must appear in the plan's commands and effects so review stays honest, be checkpointed so --resume continues them, and be checked so nothing personal (credentials, machine-specific paths, local settings files) is pushed to a public repo. Saved plans stay bound to this macacfs version's templates (the plan integrity check), which must be documented. The problem is [[newproj-experience|accomplished-by|The reviewed bootstrap mode of newproj surfaces remote effects in its plan.]]
