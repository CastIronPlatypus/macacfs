<!--stratified-action
{
  "created": 1792795284,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this flow implements it",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "lf-newproj-remote-preflight",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0232",
  "version": 1
}
-->

Remote preflight: before any directory is touched, newproj_remote_preflight checks --ru against GitHub, ru, git identity, gh, gh auth, the owner and that OWNER/NAME is free. It prints every problem and exits 1, so a failed preflight writes nothing. This flow [[fb-lib-newproj-remote|serves|The flow's code must live in fb-lib-newproj-remote's file, so moving it elsewhere requires re-binding this flow.]]. It is carried out step by step by [[fn-np-git-identity-ok|accomplished-by|_newproj_git_identity_ok performs one step of this flow, so removing it would break the flow.]], [[fn-np-remote-preflight|accomplished-by|newproj_remote_preflight performs one step of this flow, so removing it would break the flow.]]. Related flows: [[lf-newproj-remote-publish|flow|Only a passing preflight lets creation proceed to publishing.]].
