<!--stratified-action
{
  "created": 1792790679,
  "edges": [],
  "is_bead": true,
  "name": "fn-sig-scan-dirs",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0142",
  "version": 1
}
-->

_sig_scan_dirs prints the bin directories installers write into: ~/.local/bin, ~/.cargo/bin, ~/go/bin, /usr/local/bin, /opt/homebrew/bin, plus $(go env GOPATH)/bin when go is installed. Within the flow it [[lf-codesign-verify-repair|serves|_sig_scan_dirs is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-codesign|serves|_sig_scan_dirs is defined in lib/codesign.sh.]].
