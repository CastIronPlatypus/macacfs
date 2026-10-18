<!--stratified-action
{
  "created": 1789594076,
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
      "dst": "method-fns-code",
      "reason": "This file realizes the method functions.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-methods-impl",
      "reason": "The methods bead is delivered by lib/methods.sh, which contains the do_brew, do_installer_sh, do_cargo_git and do_go functions and the dispatch_row dispatcher.",
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
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0040",
  "version": 1
}
-->

The lib/methods.sh file boundary: the four install methods do_brew, do_installer_sh, do_cargo_git and do_go (there is no npm or bare-bash method; those tools go through their own installer-sh) plus dispatch_row, which picks the method from a manifest row; every method installs the latest so re-running is updating, honors DRY_RUN, and never starts a service. It [[method-fns-code|serves|This file holds the per-method install functions code unit.]] and is [[fb-lib-methods-impl|accomplished-by|lib/methods.sh contains the do_brew, do_installer_sh, do_cargo_git and do_go functions and the dispatcher.]]. Its dispatcher [[fb-manifest-tsv|couples-with|The method column of share/manifest.tsv must spell one of the four method names dispatch_row's case statement recognizes, and the ref/args columns must be in the shape each method expects.]].
