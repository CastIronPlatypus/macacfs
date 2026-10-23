<!--stratified-action
{
  "created": 1792795285,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this flow implements it",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "lf-newproj-reviewed-remote",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0234",
  "version": 1
}
-->

Reviewed bootstrap with remote effects: newproj_reviewed_main runs the embedded Python under newproj_python's python3 >= 3.9 with the bash-resolved defaults. --plan builds remote_selection, which captures the git identity, and make_plan records effects network, commit and push plus the git-add, git-commit (-c identity), gh-create and ru-add commands. --apply re-runs remote_preflight on a fresh apply, then executes and checkpoints each command, so --resume skips finished ones and only pushes when origin already exists. --guided asks the same GitHub and ru questions. This flow [[fb-lib-newproj-core|serves|The flow's code must live in fb-lib-newproj-core's file, so moving it elsewhere requires re-binding this flow.]]. It is carried out step by step by [[fn-np-python|accomplished-by|newproj_python performs one step of this flow, so removing it would break the flow.]], [[fn-np-py-default-projects-dir|accomplished-by|default_projects_dir (Python) performs one step of this flow, so removing it would break the flow.]], [[fn-np-py-default-project-dir|accomplished-by|default_project_dir (Python) performs one step of this flow, so removing it would break the flow.]], [[fn-np-py-require-parent|accomplished-by|require_parent (Python) performs one step of this flow, so removing it would break the flow.]], [[fn-np-py-user-env|accomplished-by|user_env (Python) performs one step of this flow, so removing it would break the flow.]], [[fn-np-py-quiet|accomplished-by|quiet (Python) performs one step of this flow, so removing it would break the flow.]], [[fn-np-py-gh-owner|accomplished-by|gh_owner (Python) performs one step of this flow, so removing it would break the flow.]], [[fn-np-py-git-identity|accomplished-by|git_identity (Python) performs one step of this flow, so removing it would break the flow.]], [[fn-np-py-remote-selection|accomplished-by|remote_selection (Python) performs one step of this flow, so removing it would break the flow.]], [[fn-np-py-remote-preflight|accomplished-by|remote_preflight (Python) performs one step of this flow, so removing it would break the flow.]], [[fn-np-py-scan-public|accomplished-by|scan_public (Python) performs one step of this flow, so removing it would break the flow.]]. Related flows: [[lf-newproj-remote-preflight|flow|Python's remote_preflight mirrors the bash preflight checks before a fresh apply.]].
