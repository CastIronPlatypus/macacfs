<!--stratified-action
{
  "created": 1792790673,
  "edges": [
    {
      "dst": "req-macos-only",
      "reason": "it refuses to run on anything but Darwin",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-require-darwin",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0126",
  "version": 1
}
-->

require_darwin checks uname -s and, on anything but Darwin, prints that macacfs is macOS-only and exits 1. Within the flow it [[lf-cli-dispatch|serves|require_darwin is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-bin-macacfs|serves|require_darwin is defined in bin/macacfs.]], and its code is [[fb-bin-macacfs-impl|accomplished-by|The concrete code of require_darwin lives in the bin/macacfs implementation.]].
