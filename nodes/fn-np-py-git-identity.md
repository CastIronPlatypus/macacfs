<!--stratified-action
{
  "created": 1792795332,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-py-git-identity",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0276",
  "version": 1
}
-->

git_identity (Python) returns the user.name and user.email captured at plan time (rejecting control characters), which the git-commit command passes with -c. Within the flow it [[lf-newproj-reviewed-remote|serves|git_identity (Python) performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-core|serves|git_identity (Python) must stay defined in fb-lib-newproj-core's file because its callers source that file.]], and its code is [[fb-lib-newproj-core-impl|accomplished-by|The concrete code of git_identity (Python) lives in the fb-lib-newproj-core-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-py-quiet|calls|The identity is read with git config probes.]].
