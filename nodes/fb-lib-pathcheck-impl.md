<!--stratified-action
{
  "bound_at": "0.15.0",
  "created": 1792865348,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this code is what enforces it",
      "type": "validated-by"
    }
  ],
  "impl_path": "lib/pathcheck.sh",
  "is_bead": true,
  "name": "fb-lib-pathcheck-impl",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "implementation",
  "uid": "n0292",
  "version": 1
}
-->

Implementation of lib/pathcheck.sh; it [[fb-lib-pathcheck|serves|lib/pathcheck.sh is the concrete implementation of the path-audit file boundary.]]. It defines _pc_user_dirs (~/.local/bin, ~/.cargo/bin, ~/go/bin), _pc_in_user_dir, _pc_path_hits (each executable named on PATH, de-duplicated by realpath, in PATH order), row_cli_resolved (first a|b alternative found by command -v, else the first), _pc_installed_copy (brew: $(brew --prefix <formula>)/bin/<cli>; otherwise the first bin dir copy newer than SIG_MARKER), _pc_same_tool (first word of each binary's --version under a 5 s alarm), _pc_quarantine (mv to MACACFS_SHADOW_DIR/<name>.<timestamp>) and path_audit_row, which loops while the first hit is not the installed copy: a regular file in a user dir that is the same tool is moved aside and the lookup repeated, anything else prints a fix hint and returns 1; afterwards every other hit is added to RUN_NOTE as 'also on PATH (later)'. It reads [[fb-lib-catalog-impl|calls|row_cli, row_method, row_ref and row_abbr come from lib/catalog.sh.]] accessors and the SIG_MARKER that [[fb-lib-codesign|couples-with|install_and_verify_row in lib/codesign.sh creates SIG_MARKER before dispatch and calls path_audit_row after sig_repair_row; _pc_installed_copy relies on that ordering.]] creates.
