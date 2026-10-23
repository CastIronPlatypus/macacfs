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
  "uid": "n0262",
  "version": 1
}
-->

newproj_remote_preflight collects every problem before anything is created: --ru without GitHub, ru missing, no git identity, gh missing, gh unauthenticated, owner unknown, or OWNER/NAME already on GitHub (gh api repos/OWNER/NAME must answer 404). It prints them all and returns 1. Within the flow it [[lf-newproj-remote-preflight|serves|newproj_remote_preflight performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_remote_preflight must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_remote_preflight lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-remote-active|calls|With neither GitHub nor ru selected there is nothing to check.]]; it [[fn-np-git-identity-ok|calls|The pushed initial commit requires an identity.]]; it [[fn-np-remote-owner|calls|The name-taken probe needs the owner.]].
