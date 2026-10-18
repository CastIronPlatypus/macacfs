<!--stratified-action
{
  "created": 1789593935,
  "disc_stamp": {
    "disc-callout-distal": "1.0.0",
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
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
    },
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "Providing do_brew, do_installer_sh, do_cargo_git and do_go covers every method the catalog uses; npm- and bash-based tools are reached through their own installer-sh.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "install-method-functions",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0024",
  "version": 1
}
-->

The install-method subsystem: one shell function per catalog method, do_brew (install if missing, else upgrade, tolerating brew's 'already up to date' non-zero), do_installer_sh (curl the repo's own installer from raw main and pipe it to bash with the row's args), do_cargo_git (cargo install --git <url> --force with extra args) and do_go (go install <module>@latest); there is no npm or bare-bash method, since those tools ship their own installer-sh. Each installs the latest so re-running upgrades, and each is dry-run-aware. It [[method-dispatch|serves|The method-dispatch capability selects among these per-method functions.]] and is [[method-fns-code|accomplished-by|The method functions code in lib/methods.sh realizes this subsystem.]]. It [[never-start-services|conforms-to|No method function ever starts a tool's server or daemon; each only installs or upgrades the binary.]].
