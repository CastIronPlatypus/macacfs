<!--stratified-action
{
  "created": 1792790686,
  "edges": [
    {
      "dst": "req-prefer-homebrew",
      "reason": "Homebrew is the root prerequisite",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-ensure-homebrew",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0156",
  "version": 1
}
-->

ensure_homebrew returns at once when brew exists; otherwise runs Homebrew's official installer non-interactively, evaluates brew shellenv from /opt/homebrew or /usr/local so the rest of the run sees brew, and records homebrew as installed; under dry-run it prints the installer command. Within the flow it [[lf-prereq-ensure|serves|ensure_homebrew is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-prereq|serves|ensure_homebrew is defined in lib/prereq.sh.]], and its code is [[fb-lib-prereq-impl|accomplished-by|The concrete code of ensure_homebrew lives in the lib/prereq.sh implementation.]]. It [[fn-have|calls|Checks whether brew is already present.]].
