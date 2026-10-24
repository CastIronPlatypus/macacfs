<!--stratified-action
{
  "created": 1792865313,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this capability is the requirement's mechanism",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "cli-path-audit",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0287",
  "version": 1
}
-->

After each tool installs and its signatures check out (real runs only; skipped under --dry-run), resolve its CLI on PATH under each of its catalogued names and compare the first hit with the copy the row's method installed. A stale older copy of the same tool in a user bin dir is moved aside to ~/.local/state/macacfs/shadowed and the lookup repeated; a different program ahead of the installed copy fails the tool with a fix hint; later same-name programs become notes on the tool's row. It [[install-experience|serves|Install only reports a tool ok once typing its name runs what was installed.]], it [[stale-shadowing-binaries|serves|It resolves the shadowing problem.]] and [[alternate-cli-names|serves|It checks a tool under the name its installer actually chose.]]; it is [[signature-verify-and-resign|accomplished-by|It runs inside the same post-install verification seam, right after the signature check, using the same SIG_MARKER to find what the install wrote.]] and [[pathcheck-code|accomplished-by|The capability is realized by the lib/pathcheck.sh code unit.]]. It [[run-report-surface|couples-with|Its moved-aside and also-on-PATH notes surface as text on the run report's rows.]]
