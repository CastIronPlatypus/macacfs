<!--stratified-action
{
  "created": 1792865414,
  "edges": [
    {
      "dst": "req-agent-hooks-registered",
      "reason": "this function performs part of the registration",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-ph-dcg-codex",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0304",
  "version": 1
}
-->

_ph_dcg_codex <dcg-path> runs a python3 -I script that loads ~/.codex/hooks.json (or starts empty), returns 'already' when any PreToolUse hook command is dcg, else inserts {matcher: Bash, hooks: [{type: command, command: <quoted dcg path>}]} first, backs the file up as hooks.json.bak.<timestamp>, writes atomically and returns 'added'; the note asks the user to approve the hook on Codex's next start. Within the flow it [[lf-post-install-hook|serves|It registers dcg for Codex.]]. It is defined in [[fb-lib-hooks|serves|Defined in lib/hooks.sh.]]. It [[fn-ph-note|calls|To record the result.]].
