<!--stratified-action
{
  "created": 1789593935,
  "edges": [
    {
      "dst": "method-dispatch",
      "reason": "Dispatch selects among these per-method functions.",
      "type": "serves"
    },
    {
      "dst": "method-fns-code",
      "reason": "The method-functions subsystem is realized by the method fns code.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "install-method-functions",
  "node_type": "unclassified",
  "obligations": [
    "r-method-dispatch"
  ],
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0024",
  "version": 1
}
-->

One shell function per method — do_installer_sh (curl a repo's install.sh|bash), do_brew (tap+install/upgrade), do_cargo_git (cargo install --git --force), do_go (go install), do_npm (npm -g), do_bash — each idempotent (re-run upgrades) and each dry-run-aware. Realizes [[method-dispatch|flow]], is accomplished-by [[method-fns-code|accomplished-by]], and must never call a tool's service start ([[never-start-services|flow]]).
