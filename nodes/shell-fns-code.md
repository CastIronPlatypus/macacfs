<!--stratified-action
{
  "created": 1789599679,
  "edges": [
    {
      "dst": "req-terminal-environment-parity",
      "reason": "lib/shell.sh's per-action functions and shell_run dispatcher are the concrete code that provisions each parity component and reports per item.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "shell-fns-code",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0065",
  "version": 1
}
-->

The concrete shell code: one function per provisioning action in lib/shell.sh, plus a shell_run dispatcher that walks the catalog and reports via the isolated runner. Serves [[shell-setup-functions|serves]]; accomplished by [[fb-lib-shell|accomplished-by]].
