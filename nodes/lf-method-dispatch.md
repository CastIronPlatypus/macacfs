<!--stratified-action
{
  "created": 1792790755,
  "edges": [
    {
      "dst": "req-per-tool-method-dispatch",
      "reason": "each row's method column picks the function that installs it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-method-dispatch",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0204",
  "version": 1
}
-->

Method dispatch: dispatch_row unpacks a manifest row, clears HOOK_ENV and HOOK_EXTRA_ARGS, runs the tool's pre_install_<ABBR> hook when one is defined and the row is not a skip (only announcing it under dry-run, and returning the hook's code if it fails), then branches on the method column to do_skip, do_brew, do_installer_sh (with the row args plus the hook's extra args), do_cargo_git or do_go, returning 2 with an error for any other method. This flow [[fb-lib-methods|serves|The flow is realized by code in lib/methods.sh.]]. It is carried out step by step by [[fn-dispatch-row|accomplished-by|dispatch_row performs part of this flow.]]. Related flows: [[lf-pre-install-hook|flow|A defined pre_install_<ABBR> runs before the method.]]; [[lf-install-brew|flow|method brew.]]; [[lf-install-installer-sh|flow|method installer-sh.]]; [[lf-install-cargo-git|flow|method cargo-git.]]; [[lf-install-go|flow|method go.]]; [[lf-install-skip|flow|method skip.]].
