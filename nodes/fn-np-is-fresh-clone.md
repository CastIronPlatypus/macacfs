<!--stratified-action
{
  "created": 1792869594,
  "edges": [
    {
      "dst": "req-newproj-remote-first",
      "reason": "this function is part of the remote-first order",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-np-is-fresh-clone",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0312",
  "version": 1
}
-->

newproj_is_fresh_clone DIR succeeds when DIR has a .git, HEAD does not resolve to a commit, and no entry other than .git exists, which is what a clone of the just-created empty repo looks like. Within the flow it [[lf-newproj-remote-clone|serves|It confirms the clone is safe to scaffold into.]]. It is defined in [[fb-lib-newproj-remote|serves|Defined in lib/newproj/newproj_remote.sh.]].
