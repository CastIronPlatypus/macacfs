<!--stratified-action
{
  "created": 1792795322,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-git-identity-ok",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0261",
  "version": 1
}
-->

_newproj_git_identity_ok is true when git user.name and user.email are both set. Within the flow it [[lf-newproj-remote-preflight|serves|_newproj_git_identity_ok performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|_newproj_git_identity_ok must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of _newproj_git_identity_ok lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]].
