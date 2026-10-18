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
      "reason": "The methods bead is delivered by lib/methods.sh, which contains the do_installer_sh, do_brew, do_cargo_git, do_go, do_npm, do_bash functions and dispatcher.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "lib/methods.sh supplies one function per install method plus a dispatcher keyed on the manifest's method field, exactly the per-tool dispatch required.",
      "type": "validated-by"
    },
    {
      "dst": "req-never-start-servers",
      "reason": "lib/methods.sh only builds, installs, or upgrades binaries and never starts a service, which is where the no-daemon rule is enforced for the 39 tools.",
      "type": "validated-by"
    },
    {
      "dst": "req-dry-run-no-side-effects",
      "reason": "Every install method in lib/methods.sh is dry-run-aware, so tool installs print intended actions instead of executing them when --dry-run is set.",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-lib-methods",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0040",
  "version": 1
}
-->

lib/methods.sh — do_installer_sh / do_brew / do_cargo_git / do_go / do_npm / do_bash + dispatcher; idempotent, dry-run-aware, never starts a service. Bead.
