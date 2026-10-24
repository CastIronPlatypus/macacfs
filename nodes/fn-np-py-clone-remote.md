<!--stratified-action
{
  "created": 1792869595,
  "edges": [
    {
      "dst": "req-newproj-remote-first",
      "reason": "this function is part of the remote-first order",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-np-py-clone-remote",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0313",
  "version": 1
}
-->

clone_remote(plan) (Python) refuses a planned directory that already exists, runs every before-root command (gh-create, ru-add, ru-sync or gh-clone) with user_env() and a 180 s timeout, naming what exists when one fails, then with ru checks that ru list --json maps the repo to exactly the planned directory, requires the clone's .git, and points HEAD at main when the repo has no commits. Within the flow it [[lf-newproj-reviewed-remote|serves|It is the reviewed bootstrap's remote-first clone.]]. It is defined in [[fb-lib-newproj-core|serves|Defined in lib/newproj/newproj.sh's embedded Python.]]. It [[fn-np-py-user-env|calls|For the user's environment.]] and [[fn-np-py-quiet|calls|For ru list --json.]].
