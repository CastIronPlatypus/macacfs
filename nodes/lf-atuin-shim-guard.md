<!--stratified-action
{
  "created": 1792790760,
  "edges": [
    {
      "dst": "req-terminal-environment-parity",
      "reason": "atuin is kept but made safe inside coding-agent shells",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-atuin-shim-guard",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0214",
  "version": 1
}
-->

Atuin shim guard: the shim installed at ~/.local/bin/atuin finds the real atuin (failing with 127 if absent), swallows 'atuin hook' by draining stdin, and for 'history start|end' checks _in_agent (agent environment markers or an agent parent process) and exits 0 there; every other call execs the real atuin unchanged. This flow [[fb-share-atuin-guard|serves|The flow is realized by code in share/atuin-guard.sh.]]. It is carried out step by step by [[fn-shell-atuin|accomplished-by|shell_atuin performs part of this flow.]], [[fn-in-agent|accomplished-by|_in_agent performs part of this flow.]].
