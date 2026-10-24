<!--stratified-action
{
  "created": 1792865407,
  "edges": [
    {
      "dst": "req-agent-hooks-registered",
      "reason": "this function performs part of the registration",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-post-install-hook",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0294",
  "version": 1
}
-->

Post-install hook: when the install, signature check and path audit all succeed, install_and_verify_row calls post_install_<ABBR> if lib/hooks.sh defines it. post_install_DCG runs dcg install for Claude Code, adds --opencode when OpenCode is present, and calls _ph_dcg_codex when Codex is present; post_install_CM checks cm hook status and installs the user-level hook only when missing. Each records a note through _ph_note; any failure fails the tool. Under --dry-run run_tools only prints that the hook would run. This flow [[fb-lib-hooks|serves|The flow is realized by the post-install hooks in lib/hooks.sh.]]. It is carried out by [[fn-post-install-dcg|accomplished-by|post_install_DCG registers dcg.]], [[fn-ph-dcg-codex|accomplished-by|_ph_dcg_codex edits Codex's hooks.json.]], [[fn-post-install-cm|accomplished-by|post_install_CM installs cm's hook.]] and [[fn-ph-note|accomplished-by|_ph_note records results.]]. Related flows: [[lf-cli-path-audit|flow|It runs only after the path audit passes.]]; [[lf-pre-install-hook|flow|It is the post-install counterpart of the pre-install hook flow.]].
