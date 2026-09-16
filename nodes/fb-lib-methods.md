<!--stratified-action
{
  "created": 1789594076,
  "edges": [
    {
      "dst": "method-fns-code",
      "reason": "This file realizes the method functions.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-methods-impl",
      "type": "accomplished-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-methods",
  "node_type": "impl",
  "obligations": [
    "r-method-dispatch",
    "r-no-servers",
    "r-dry-run"
  ],
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0040",
  "version": 1
}
-->

lib/methods.sh — do_installer_sh / do_brew / do_cargo_git / do_go / do_npm / do_bash + dispatcher; idempotent, dry-run-aware, never starts a service. Bead.
