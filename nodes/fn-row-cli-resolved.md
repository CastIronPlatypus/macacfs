<!--stratified-action
{
  "created": 1792865412,
  "edges": [
    {
      "dst": "req-cli-resolves-to-installed-copy",
      "reason": "this function is part of the check",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-row-cli-resolved",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0302",
  "version": 1
}
-->

row_cli_resolved <row> splits the row's cli column on | and prints the first alternative found by command -v, else the first alternative; every cli lookup uses it so rows like 'pi-rust|pi' work. Within the flow it [[lf-cli-path-audit|serves|It picks the name to audit.]]. It is defined in [[fb-lib-pathcheck|serves|Defined in lib/pathcheck.sh.]]. It [[fn-row-cli|calls|For the raw cli column.]].
