<!--stratified-action
{
  "created": 1792790673,
  "edges": [],
  "is_bead": false,
  "name": "fn-usage",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0127",
  "version": 1
}
-->

usage prints the version banner, every command with its options, the selector rules, and the catalog size. Within the flow it [[lf-cli-dispatch|serves|usage is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-bin-macacfs|serves|usage is defined in bin/macacfs.]], and its code is [[fb-bin-macacfs-impl|accomplished-by|The concrete code of usage lives in the bin/macacfs implementation.]]. It [[fn-catalog-count|calls|The help text reports how many tools are in the catalog.]].
