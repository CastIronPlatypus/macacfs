<!--stratified-action
{
  "created": 1792790680,
  "edges": [
    {
      "dst": "req-runnable-signatures",
      "reason": "it re-signs any binary macOS would kill at launch",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-sig-repair-row",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0144",
  "version": 1
}
-->

sig_repair_row <row> walks the candidates, de-duplicating by real path and keeping regular Mach-O files, runs codesign -v --no-strict on each, and for each failure makes it writable if needed, re-signs it ad-hoc with codesign --force -s -, re-verifies, restores its mode, and appends 're-signed <path>' to RUN_NOTE; it returns 1 if any binary could not be made writable or repaired. Within the flow it [[lf-codesign-verify-repair|serves|sig_repair_row is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-codesign|serves|sig_repair_row is defined in lib/codesign.sh.]]. It [[fn-sig-candidates|calls|It verifies each candidate file.]].
