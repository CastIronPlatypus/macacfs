<!--stratified-action
{
  "created": 1792790686,
  "edges": [],
  "is_bead": false,
  "name": "fn-ensure-rust",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0158",
  "version": 1
}
-->

ensure_rust returns when cargo exists, otherwise installs Rust with the rustup one-liner (-y), sources ~/.cargo/env, and records rust; under dry-run it prints. Within the flow it [[lf-prereq-ensure|serves|ensure_rust is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-prereq|serves|ensure_rust is defined in lib/prereq.sh.]], and its code is [[fb-lib-prereq-impl|accomplished-by|The concrete code of ensure_rust lives in the lib/prereq.sh implementation.]]. It [[fn-have|calls|Checks for cargo.]].
