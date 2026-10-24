<!--stratified-action
{
  "created": 1792865327,
  "edges": [
    {
      "dst": "req-agent-hooks-registered",
      "reason": "this code performs the registrations",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "agent-setup-code",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0290",
  "version": 1
}
-->

Code unit: the post-install hooks in lib/hooks.sh. post_install_DCG runs 'dcg install --quiet' (Claude Code), 'dcg install --opencode --quiet' when opencode is on PATH, and _ph_dcg_codex when Codex is present, which merges a PreToolUse Bash group with the quoted dcg path at the front of ~/.codex/hooks.json through a small python3 -I script (backup first, atomic replace, no-op when dcg is already there); post_install_CM skips when 'cm hook status' shows the claude user hook installed, else runs 'cm hook install --global'; _ph_note appends each result to RUN_NOTE. It [[agent-hook-setup|serves|This code realizes the agent-hook capability.]] and is [[fb-lib-hooks|accomplished-by|The hooks live in lib/hooks.sh.]]. It [[signature-repair-code|couples-with|install_and_verify_row is what calls post_install_<ABBR>, after the signature and path checks pass.]]
