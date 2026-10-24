<!--stratified-action
{
  "created": 1792865326,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this code enforces it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "pathcheck-code",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0289",
  "version": 1
}
-->

Code unit in lib/pathcheck.sh: row_cli_resolved picks the first of a row's a|b cli names that is on PATH; _pc_installed_copy finds what the method installed (the brew formula's bin entry, or the newest copy written into a bin dir since SIG_MARKER); _pc_path_hits lists every distinct copy of the name on PATH in order; path_audit_row moves a stale same-tool copy found in a user bin dir aside with _pc_quarantine (after _pc_same_tool compares --version program names and _pc_in_user_dir checks the location), fails when a different program comes first, and appends notes to RUN_NOTE. It [[cli-path-audit|serves|This code realizes the path-audit capability.]] and is [[fb-lib-pathcheck|accomplished-by|The code unit lives in lib/pathcheck.sh.]]. It [[signature-repair-code|couples-with|install_and_verify_row calls path_audit_row only after sig_repair_row succeeds, and _pc_installed_copy reads the SIG_MARKER that code creates.]] and [[catalog-loader-code|couples-with|It reads rows only through the catalog's row_* accessors, and every cli lookup elsewhere must go through row_cli_resolved once a row lists alternatives.]]
