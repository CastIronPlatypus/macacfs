<!--stratified-action
{
  "created": 1792790760,
  "edges": [
    {
      "dst": "req-self-update",
      "reason": "macacfs updates itself from its public repo on request",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-self-update",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0215",
  "version": 1
}
-->

Self-update: when MACACFS_HOME is a git checkout, selfupdate_run fast-forwards it from origin (failing loud on a non-fast-forward); otherwise it clones the repo shallowly into a temp dir, moves the old home aside, moves the clone in, and deletes the backup, keeping the original if the swap fails; it then restores the executable bit and prints the new VERSION. Under dry-run it prints which of the two it would do. This flow [[fb-lib-selfupdate|serves|The flow is realized by code in lib/selfupdate.sh.]]. It is carried out step by step by [[fn-selfupdate-run|accomplished-by|selfupdate_run performs part of this flow.]].
