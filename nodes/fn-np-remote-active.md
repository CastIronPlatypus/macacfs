<!--stratified-action
{
  "created": 1792795317,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-remote-active",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0253",
  "version": 1
}
-->

newproj_remote_active is true when GitHub is not off or ru is on. Within the flow it [[lf-newproj-remote-selection|serves|newproj_remote_active performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_remote_active must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_remote_active lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]].
