<!--stratified-action
{
  "created": 1792790702,
  "edges": [
    {
      "dst": "req-never-start-servers",
      "reason": "it reloads tmux only if a server already runs, never starting one",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-shell-tmux",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0191",
  "version": 1
}
-->

shell_tmux backs up a non-managed ~/.tmux.conf, installs share/tmux.conf there, and sources it into tmux only when a tmux server is already running; under dry-run it prints. Within the flow it [[lf-shell-setup|serves|shell_tmux is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-shell|serves|shell_tmux is defined in lib/shell.sh.]], and its code is [[fb-lib-shell-impl|accomplished-by|The concrete code of shell_tmux lives in the lib/shell.sh implementation.]]. It [[fn-sh-dry|calls|Dry-run test.]].
