<!--stratified-action
{
  "created": 1792795324,
  "edges": [
    {
      "dst": "req-newproj-never-deletes",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-remote-ensure-commit",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0264",
  "version": 1
}
-->

newproj_remote_ensure_commit makes an 'Initial commit' of what newproj created when HEAD does not exist, because gh --push needs one. Within the flow it [[lf-newproj-remote-publish|serves|newproj_remote_ensure_commit performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_remote_ensure_commit must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_remote_ensure_commit lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]].
