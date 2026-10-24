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
  "name": "fn-post-install-cm",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0305",
  "version": 1
}
-->

post_install_CM returns early with a note when 'cm hook status' lists the claude user hook as installed, else runs 'cm hook install --global', failing the tool if that fails. Within the flow it [[lf-post-install-hook|serves|It installs cm's reflection hook.]]. It is defined in [[fb-lib-hooks|serves|Defined in lib/hooks.sh.]]. It [[fn-ph-note|calls|To record the result.]].
