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
  "succeeds": "lf-newproj-reviewed-remote@v1",
  "uid": "n0234",
  "version": 2
}
-->

Reviewed bootstrap with remote effects: newproj_reviewed_main runs the embedded Python under newproj_python's python3 >= 3.9 with the bash-resolved defaults. --plan builds remote_selection (capturing the git identity), require_ru_path refuses a directory that is not ru's path when ru is selected, and make_plan records effects network, commit and push and the remote-first command order: before-root gh-create (empty repo), then ru-add and ru-sync or gh-clone, then the file and beads steps with no git-init, then git-add, git-commit (-c identity) and git-push. --apply re-runs remote_preflight on a fresh apply; clone_remote runs the before-root commands with the user's environment, refuses an existing directory, checks that ru cloned to the planned path and points HEAD at main; the clone may hold only .git; the checkpoint starts with the before-root commands done, and --resume skips finished commands. --guided asks the same GitHub and ru questions. This flow [[fb-lib-newproj-core|serves|The flow's code lives in lib/newproj/newproj.sh.]]. It is carried out step by step by [[fn-np-python|accomplished-by|newproj_python picks the interpreter.]], [[fn-np-py-default-projects-dir|accomplished-by|default_projects_dir gives the base.]], [[fn-np-py-default-project-dir|accomplished-by|default_project_dir gives ru's path.]], [[fn-np-py-require-parent|accomplished-by|require_parent checks the parent.]], [[fn-np-py-require-ru-path|accomplished-by|require_ru_path pins the directory to ru's path.]], [[fn-np-py-user-env|accomplished-by|user_env gives gh, ru and git push the user's environment.]], [[fn-np-py-quiet|accomplished-by|quiet runs probes.]], [[fn-np-py-gh-owner|accomplished-by|gh_owner resolves the owner.]], [[fn-np-py-git-identity|accomplished-by|git_identity captures the identity.]], [[fn-np-py-remote-selection|accomplished-by|remote_selection validates the choice.]], [[fn-np-py-remote-preflight|accomplished-by|remote_preflight checks before mutation.]], [[fn-np-py-clone-remote|accomplished-by|clone_remote creates and clones before the root.]] and [[fn-np-py-scan-public|accomplished-by|scan_public guards public repos.]]. Related flows: [[lf-newproj-remote-preflight|flow|Python's remote_preflight mirrors the bash checks.]]; [[lf-newproj-remote-clone|flow|clone_remote is the Python counterpart of the clone flow.]].
