<!--stratified-action
{
  "created": 1792795286,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this flow implements it",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "lf-newproj-classic-remote",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "logical-flow",
  "succeeds": "lf-newproj-classic-remote@v1",
  "uid": "n0235",
  "version": 2
}
-->

Classic remote-first: main parses NAME [DIR] and the --no-* and remote flags, resolves the selection and default directory, and runs the remote preflight with the explicit DIR (if any). With --github it refuses an existing directory, runs the remote-first clone flow and continues in NEWPROJ_CLONE_DIR, accepting it only as a fresh clone (only .git, no commits); without --github it creates the layout parent and refuses a non-empty directory as before. It then scaffolds README, ignores, beads, Claude settings and AGENTS.md (git init only when there is no clone), logging with _newproj_log_ts timestamps, commits when a git identity exists, runs the commit-and-push flow and suggests 'claude' as the next step, exiting 1 when publishing failed. This flow [[fb-lib-newproj-core|serves|The flow's code lives in lib/newproj/newproj.sh.]]. It is carried out step by step by [[fn-np-log-ts|accomplished-by|_newproj_log_ts timestamps its log lines.]]. Related flows: [[lf-newproj-projects-dir|flow|With no DIR the default comes from this resolver.]]; [[lf-newproj-remote-preflight|flow|Preflight runs before anything is created.]]; [[lf-newproj-remote-clone|flow|With --github the repo is created and cloned before scaffolding.]]; [[lf-newproj-remote-publish|flow|Commit and push run after the scaffold.]].
