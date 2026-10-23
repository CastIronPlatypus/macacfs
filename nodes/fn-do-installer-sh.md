<!--stratified-action
{
  "created": 1792790682,
  "edges": [],
  "is_bead": false,
  "name": "fn-do-installer-sh",
  "no_requirement": "function-level helper; the governing requirement is carried by its flow and file boundary",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0149",
  "version": 1
}
-->

do_installer_sh <repo> <ref> [args...] resolves the installer URL at main or, for @latest-release/<path>, at the tag the GitHub releases API reports (failing loud if unresolved), and pipes it to bash under env HOOK_ENV with args via bash -s --; under dry-run it prints the curl | bash line. Within the flow it [[lf-install-installer-sh|serves|do_installer_sh is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-methods|serves|do_installer_sh is defined in lib/methods.sh.]], and its code is [[fb-lib-methods-impl|accomplished-by|The concrete code of do_installer_sh lives in the lib/methods.sh implementation.]].
