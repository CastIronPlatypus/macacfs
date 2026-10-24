<!--stratified-action
{
  "created": 1792790680,
  "edges": [],
  "is_bead": true,
  "name": "fn-sig-candidates",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "retire_reason": "resolves the CLI through row_cli_resolved so a|b alternatives work",
  "retired_at": 1792865454,
  "status": "retired",
  "stratum": "function-map",
  "uid": "n0143",
  "version": 1
}
-->

_sig_candidates <row> prints the files one install may have produced: files and links in the scan directories newer than SIG_MARKER, the brew formula's own files for brew rows (bottles keep upstream mtimes), and the tool's CLI as resolved on PATH. Within the flow it [[lf-codesign-verify-repair|serves|_sig_candidates is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-codesign|serves|_sig_candidates is defined in lib/codesign.sh.]]. It [[fn-sig-scan-dirs|calls|It scans those directories.]]; it [[fn-row-method|calls|It checks whether the row is a brew row.]]; it [[fn-row-ref|calls|It reads the formula name for brew list.]]; it [[fn-row-cli|calls|It resolves the tool's CLI on PATH.]].
