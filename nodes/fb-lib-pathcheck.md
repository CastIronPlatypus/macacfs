<!--stratified-action
{
  "created": 1792865348,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this file holds the check",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fb-lib-pathcheck",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0291",
  "version": 1
}
-->

The lib/pathcheck.sh file boundary: the post-install CLI path audit (path_audit_row), the alternate-name resolver row_cli_resolved used by every cli lookup, and the private helpers that list PATH hits, find the installed copy, compare tools by --version and move stale copies aside to MACACFS_SHADOW_DIR (default ~/.local/state/macacfs/shadowed). Sourced by bin/macacfs right after lib/codesign.sh. It [[pathcheck-code|serves|This file holds the path-audit code unit.]] and is [[fb-lib-pathcheck-impl|accomplished-by|lib/pathcheck.sh contains the functions.]]. Its alternate-name parsing [[fb-manifest-tsv|couples-with|The cli column's a|b syntax is defined here, so manifest rows may only use | to separate names.]]
