<!--stratified-action
{
  "created": 1792795318,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-remote-owner",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0254",
  "version": 1
}
-->

newproj_remote_owner prints the explicit --github-owner, else the cached 'gh api user -q .login', and fails when gh is absent or unauthenticated. Within the flow it [[lf-newproj-remote-selection|serves|newproj_remote_owner performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_remote_owner must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_remote_owner lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]].
