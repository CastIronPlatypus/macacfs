<!--stratified-action
{
  "created": 1792865413,
  "edges": [
    {
      "dst": "req-agent-hooks-registered",
      "reason": "this function performs part of the registration",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-post-install-dcg",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0303",
  "version": 1
}
-->

post_install_DCG finds dcg on PATH, runs 'dcg install --quiet' (Claude Code), runs 'dcg install --opencode --quiet' when opencode is on PATH, and calls _ph_dcg_codex when codex is on PATH or ~/.codex exists, failing the tool on any error and noting each registration. Within the flow it [[lf-post-install-hook|serves|It registers dcg.]]. It is defined in [[fb-lib-hooks|serves|Defined in lib/hooks.sh.]]. It [[fn-ph-dcg-codex|calls|For Codex.]] and [[fn-ph-note|calls|To record results.]].
