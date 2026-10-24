<!--stratified-action
{
  "created": 1792865406,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this function is part of the check",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-cli-path-audit",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0293",
  "version": 1
}
-->

CLI path audit: after sig_repair_row succeeds, install_and_verify_row calls path_audit_row, which resolves the row's name via row_cli_resolved, asks _pc_installed_copy for what the method installed and _pc_path_hits for every copy on PATH; while the first hit is not the installed copy it either moves a stale same-tool copy out of a user bin dir with _pc_quarantine and looks again, or prints a fix hint and fails; then it notes every later same-name hit on RUN_NOTE. This flow [[fb-lib-pathcheck|serves|The flow is realized by code in lib/pathcheck.sh.]]. It is carried out by [[fn-path-audit-row|accomplished-by|path_audit_row drives the flow.]], [[fn-row-cli-resolved|accomplished-by|row_cli_resolved picks the name.]], [[fn-pc-installed-copy|accomplished-by|_pc_installed_copy finds the target.]], [[fn-pc-path-hits|accomplished-by|_pc_path_hits lists what PATH resolves.]], [[fn-pc-same-tool|accomplished-by|_pc_same_tool decides stale versus foreign.]], [[fn-pc-in-user-dir|accomplished-by|_pc_in_user_dir limits moves to user dirs.]], [[fn-pc-user-dirs|accomplished-by|_pc_user_dirs names those dirs.]] and [[fn-pc-quarantine|accomplished-by|_pc_quarantine moves the stale copy aside.]]. Related flows: [[lf-codesign-verify-repair|flow|It runs right after the signature check in the same post-install step.]]; [[lf-isolated-run-report|flow|Its notes and failures reach the summary via RUN_NOTE and the return code.]].
