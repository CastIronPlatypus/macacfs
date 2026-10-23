<!--stratified-action
{
  "created": 1792790683,
  "edges": [],
  "is_bead": false,
  "name": "fn-do-cargo-git",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0150",
  "version": 1
}
-->

do_cargo_git <git-url> [args...] runs cargo install --git <url> --force with any extra args. Within the flow it [[lf-install-cargo-git|serves|do_cargo_git is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-methods|serves|do_cargo_git is defined in lib/methods.sh.]], and its code is [[fb-lib-methods-impl|accomplished-by|The concrete code of do_cargo_git lives in the lib/methods.sh implementation.]]. It [[fn-m-run|calls|Execution goes through the dry-run wrapper.]].
