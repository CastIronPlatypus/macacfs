<!--stratified-action
{
  "created": 1792790753,
  "edges": [
    {
      "dst": "req-dry-run-no-side-effects",
      "reason": "DRY_RUN is the single switch every side-effecting step checks",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-dry-run-propagation",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0200",
  "version": 1
}
-->

Dry-run propagation: parse_dry_run strips --dry-run from the arguments and exports DRY_RUN=1 (self-update reads it directly); every side-effecting helper then consults that one global: _m_run and _run echo the command instead of executing it, _sh_dry gates shell provisioning, do_brew, do_installer_sh, the prereq installers and selfupdate_run print their intended action and return 0, dispatch_row only announces a pre-install hook, and run_tools and shell_run bypass run_isolated and the signature check, recording each row as ok '(dry-run)' unless a step set its own status. This flow [[fb-bin-macacfs|serves|The flow is realized by code in bin/macacfs.]]. It is carried out step by step by [[fn-parse-dry-run|accomplished-by|parse_dry_run performs part of this flow.]], [[fn-m-run|accomplished-by|_m_run performs part of this flow.]], [[fn-run|accomplished-by|_run performs part of this flow.]], [[fn-sh-dry|accomplished-by|_sh_dry performs part of this flow.]]. Related flows: [[lf-tool-run-engine|relates-to|run_tools branches on DRY_RUN to skip isolation and signature repair.]]; [[lf-shell-setup|relates-to|shell_run branches on DRY_RUN the same way for provisioning steps.]].
