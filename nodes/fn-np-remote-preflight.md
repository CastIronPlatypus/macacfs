<!--stratified-action
{
  "created": 1792795323,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-remote-preflight",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "succeeds": "fn-np-remote-preflight@v1",
  "uid": "n0262",
  "version": 2
}
-->

newproj_remote_preflight NAME [EXPLICIT_DIR] returns 0 when no remote is selected; otherwise it collects every problem before anything is created: --ru without --github; with --ru and an explicit directory, a directory that is not newproj_default_project_dir (ru's layout path); ru missing; a missing git identity; gh missing or unauthenticated; an owner that does not resolve; OWNER/NAME already existing or uncheckable. It prints them all and returns 1. Within the flow it [[lf-newproj-remote-preflight|serves|It is the preflight.]]. It is defined in [[fb-lib-newproj-remote|serves|Defined in lib/newproj/newproj_remote.sh.]]. It [[fn-np-remote-active|calls|To skip when off.]], [[fn-np-default-project-dir|calls|For ru's path.]], [[fn-np-git-identity-ok|calls|For the identity.]] and [[fn-np-remote-owner|calls|For the owner.]].
