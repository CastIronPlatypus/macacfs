<!--stratified-action
{
  "created": 1789599679,
  "edges": [],
  "is_bead": false,
  "name": "shell-fns-code",
  "node_type": "impl",
  "obligations": [
    "r-terminal-env"
  ],
  "status": "drafting",
  "stratum": "components",
  "uid": "n0065",
  "version": 1
}
-->

The concrete shell code: one function per provisioning action in lib/shell.sh, plus a shell_run dispatcher that walks the catalog and reports via the isolated runner. Serves [[shell-setup-functions|serves]]; accomplished by [[fb-lib-shell|accomplished-by]].
