<!--stratified-action
{
  "created": 1792795282,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this flow implements it",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "lf-newproj-dispatch",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0229",
  "version": 1
}
-->

newproj dispatch: 'macacfs newproj|new ARGS' requires Darwin, prints prereq_warn_newproj's note about missing gh, ru, br or python3, then exec's "$BASH" lib/newproj/newproj.sh ARGS. newproj.sh's BASH_VERSINFO guard refuses bash older than 4.3, then --plan/--apply/--guided go to the reviewed bootstrap, -i to the wizard and anything else to the classic CLI, each after the GitHub/ru selection is resolved. This flow [[fb-bin-macacfs|serves|The flow's code must live in fb-bin-macacfs's file, so moving it elsewhere requires re-binding this flow.]]. It is carried out step by step by [[fn-prereq-warn-newproj|accomplished-by|prereq_warn_newproj performs one step of this flow, so removing it would break the flow.]]. Related flows: [[lf-newproj-classic-remote|flow|Classic arguments continue into the classic create-then-publish flow.]]; [[lf-newproj-wizard-remote|flow|-i continues into the wizard flow.]]; [[lf-newproj-reviewed-remote|flow|--plan, --apply and --guided continue into the reviewed bootstrap flow.]]; [[lf-prereq-ensure|flow|Unlike install's prereq_ensure, newproj only warns, because a missing gh or ru matters only when those features are selected.]]. main's newproj branch [[fn-main|accomplished-by|main's newproj|new branch is where the exec happens, so without it the verb would fall through to usage and exit 2.]].
