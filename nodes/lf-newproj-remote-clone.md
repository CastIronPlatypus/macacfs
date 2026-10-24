<!--stratified-action
{
  "created": 1792869543,
  "edges": [
    {
      "dst": "req-newproj-remote-first",
      "reason": "this flow is the requirement's first step",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "lf-newproj-remote-clone",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0308",
  "version": 1
}
-->

Remote-first clone: after preflight and before any project file exists, newproj_remote_clone resolves the owner, runs gh repo create OWNER/NAME --private|--public (an empty repo) and records the URL; with ru it runs ru add OWNER/NAME --non-interactive [--private] and ru sync OWNER/NAME --clone-only --non-interactive, then takes the clone's path from _newproj_ru_path (ru list --json) and requires a .git there; without ru it creates the layout parent and runs gh repo clone OWNER/NAME DIR. It points HEAD at main when the repo has no commits and sets NEWPROJ_CLONE_DIR; newproj_is_fresh_clone then confirms the clone holds only .git. Each failure names what already exists and the command to finish. This flow [[fb-lib-newproj-remote|serves|The flow's code lives in lib/newproj/newproj_remote.sh.]]. It is carried out by [[fn-np-remote-clone|accomplished-by|newproj_remote_clone drives it.]], [[fn-np-ru-path|accomplished-by|_newproj_ru_path reads ru's path.]] and [[fn-np-is-fresh-clone|accomplished-by|newproj_is_fresh_clone checks the clone.]]. Related flows: [[lf-newproj-remote-preflight|flow|It runs only after preflight passes.]]; [[lf-newproj-remote-publish|flow|Publishing pushes from this clone at the end.]]; [[lf-newproj-projects-dir|flow|Without ru the clone target is the resolved default directory.]].
