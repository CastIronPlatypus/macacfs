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
  "retire_reason": "classic main clones first with --github and scaffolds inside the clone",
  "retired_at": 1792869566,
  "status": "retired",
  "stratum": "logical-flow",
  "uid": "n0235",
  "version": 1
}
-->

Classic create-then-publish: main parses NAME [DIR] and the --no-* and remote flags, resolves the selection and default directory, runs the remote preflight, creates the layout parent, refuses a non-empty directory, scaffolds git, README, ignores, beads, Claude settings and AGENTS.md (logging with _newproj_log_ts timestamps), then runs the publish-and-register flow and suggests 'claude' as the next step, exiting 1 when publishing failed. This flow [[fb-lib-newproj-core|serves|The flow's code must live in fb-lib-newproj-core's file, so moving it elsewhere requires re-binding this flow.]]. It is carried out step by step by [[fn-np-log-ts|accomplished-by|_newproj_log_ts performs one step of this flow, so removing it would break the flow.]]. Related flows: [[lf-newproj-projects-dir|flow|With no DIR the classic default comes from this resolver.]]; [[lf-newproj-remote-preflight|flow|Preflight runs before any file is created.]]; [[lf-newproj-remote-publish|flow|Publishing runs after the scaffold.]].
