<!--stratified-action
{
  "created": 1792865415,
  "edges": [
    {
      "dst": "req-agent-hooks-registered",
      "reason": "this function performs part of the registration",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-ph-note",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0306",
  "version": 1
}
-->

_ph_note <text> appends text to RUN_NOTE, separated by '; ', so a post-install hook's results appear on the tool's summary row. Within the flow it [[lf-post-install-hook|serves|It records hook results.]]. It is defined in [[fb-lib-hooks|serves|Defined in lib/hooks.sh.]].
