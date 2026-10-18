<!--stratified-action
{
  "created": 1792285758,
  "edges": [
    {
      "dst": "req-runnable-signatures",
      "reason": "collects a tool's installed binaries and runs codesign verify/re-sign over them",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "signature-verify-and-resign",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0082",
  "version": 1
}
-->

Collect one tool's candidate binaries — files written into the bin dirs (~/.local/bin, ~/.cargo/bin, GOPATH/bin, /usr/local/bin, /opt/homebrew/bin) during its install, the brew formula's own files, and its CLI as resolved on PATH — dedupe by real path, keep Mach-O files, codesign -v each, and re-sign failures with codesign --force -s - (temporarily making read-only Cellar files writable). Serves [[signature-repair|serves|this subsystem is the mechanism behind the signature-repair capability]]. Accomplished by [[signature-repair-code|accomplished-by|the subsystem is realized by the signature-repair code unit]].
