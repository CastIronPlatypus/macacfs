<!--stratified-action
{
  "created": 1789594032,
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
      "dst": "install-method-functions",
      "reason": "These functions realize the install-method-functions subsystem.",
      "type": "serves"
    },
    {
      "dst": "fb-lib-methods",
      "reason": "The per-method functions and dispatch_row live in the lib/methods.sh file.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "This code unit holds the per-method functions and the dispatcher that selects one by the row's method field, realizing per-tool dispatch.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "method-fns-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "retire_reason": "dispatch_row gains the skip method (Linux-only rows) and per-tool pre-install hooks that can pass an environment and extra args to the installer.",
  "retired_at": 1792289474,
  "status": "retired",
  "stratum": "components",
  "uid": "n0031",
  "version": 1
}
-->

Code unit in lib/methods.sh holding the per-method functions do_brew, do_installer_sh, do_cargo_git and do_go (with the _m_run dry-run wrapper) and dispatch_row, which reads a row's method, repo, ref and args via the catalog accessors and calls the matching function, failing with rc 2 on an unknown method; each function installs the latest (idempotent) and is dry-run-aware. It [[install-method-functions|serves|These functions realize the install-method-functions subsystem.]] and is [[fb-lib-methods|accomplished-by|The per-method functions and dispatch_row live in the lib/methods.sh file.]]. Its row reads [[catalog-loader-code|calls|dispatch_row calls row_method, row_repo, row_ref, row_args and row_abbr from the catalog loader to unpack each manifest row.]].
