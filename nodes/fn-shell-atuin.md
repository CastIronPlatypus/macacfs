<!--stratified-action
{
  "created": 1792790704,
  "edges": [
    {
      "dst": "req-never-start-servers",
      "reason": "it installs atuin and its shim without launching the atuin daemon",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-shell-atuin",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0195",
  "version": 1
}
-->

shell_atuin installs or upgrades the atuin formula, locates the real binary under brew's prefix, backs up a non-macacfs ~/.local/bin/atuin, and writes share/atuin-guard.sh there with __REAL_ATUIN__ replaced by the real path, mode 0755; under dry-run it prints. Within the flow it [[lf-shell-setup|serves|shell_atuin is one of the functions that carries out this flow.]], and [[lf-atuin-shim-guard|serves|shell_atuin is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|shell_atuin is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of shell_atuin lives in the lib/shell.sh implementation.]]. It [[fn-brew-pkg|calls|Formula install.]]; it [[fn-sh-brew-prefix|calls|Locates the real atuin.]]; it [[fn-sh-dry|calls|Dry-run test.]].
