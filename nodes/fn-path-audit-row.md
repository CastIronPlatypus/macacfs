<!--stratified-action
{
  "created": 1792865407,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this function is part of the check",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-path-audit-row",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0295",
  "version": 1
}
-->

path_audit_row <row> resolves the row's CLI, finds the installed copy (falling back to the first PATH hit when unknown), fails when the name is not on PATH, moves stale same-tool copies in user dirs aside until the installed copy comes first, fails with a fix hint when a different program comes first, and adds an 'also on PATH (later)' note for each other hit. Within the flow it [[lf-cli-path-audit|serves|path_audit_row drives this flow.]]. It is defined in [[fb-lib-pathcheck|serves|path_audit_row is defined in lib/pathcheck.sh.]]. It [[fn-row-cli-resolved|calls|To pick the name.]], [[fn-pc-installed-copy|calls|To find the target.]], [[fn-pc-path-hits|calls|To list PATH hits.]], [[fn-pc-in-user-dir|calls|To limit moves.]], [[fn-pc-same-tool|calls|To tell stale from foreign.]] and [[fn-pc-quarantine|calls|To move the stale copy.]].
