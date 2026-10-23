<!--stratified-action
{
  "created": 1792790672,
  "edges": [],
  "is_bead": false,
  "name": "fn-resolve-dir",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0125",
  "version": 1
}
-->

_resolve_dir <path> follows a symlink chain (resolving relative link targets against the link's directory) and prints the physical directory of the final file, so bin/macacfs finds its install home even when run through ~/.local/bin/macacfs. Within the flow it [[lf-cli-dispatch|serves|_resolve_dir is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-bin-macacfs|serves|_resolve_dir is defined in bin/macacfs.]], and its code is [[fb-bin-macacfs-impl|accomplished-by|The concrete code of _resolve_dir lives in the bin/macacfs implementation.]].
