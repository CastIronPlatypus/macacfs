<!--stratified-action
{
  "created": 1792790697,
  "edges": [
    {
      "dst": "req-self-update",
      "reason": "it updates the macacfs install itself",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-selfupdate-run",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0181",
  "version": 1
}
-->

selfupdate_run fast-forwards MACACFS_HOME from origin when it is a git checkout, otherwise shallow-clones the repo into a temp dir and swaps it in (old home moved aside, new moved in, backup removed, original kept on failure), then restores the executable bit and prints the new version; under dry-run it prints which path it would take. Within the flow it [[lf-self-update|serves|selfupdate_run is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-selfupdate|serves|selfupdate_run is defined in lib/selfupdate.sh.]], and its code is [[fb-lib-selfupdate-impl|accomplished-by|The concrete code of selfupdate_run lives in the lib/selfupdate.sh implementation.]].
