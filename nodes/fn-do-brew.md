<!--stratified-action
{
  "created": 1792790682,
  "edges": [
    {
      "dst": "req-prefer-homebrew",
      "reason": "it installs or upgrades through brew",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-do-brew",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0148",
  "version": 1
}
-->

do_brew <ref> upgrades the formula when brew lists it (ignoring brew's non-zero 'up to date' and then confirming it is still listed), or brew-installs the ref when it is absent; under dry-run it only prints. Within the flow it [[lf-install-brew|serves|do_brew is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-methods|serves|do_brew is defined in lib/methods.sh.]], and its code is [[fb-lib-methods-impl|accomplished-by|The concrete code of do_brew lives in the lib/methods.sh implementation.]].
