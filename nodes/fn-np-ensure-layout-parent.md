<!--stratified-action
{
  "created": 1792795321,
  "edges": [
    {
      "dst": "req-newproj-follows-ru-layout",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-ensure-layout-parent",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0260",
  "version": 1
}
-->

newproj_ensure_layout_parent runs mkdir -p for a missing parent beneath an existing base and never creates the base itself. Within the flow it [[lf-newproj-projects-dir|serves|newproj_ensure_layout_parent performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_ensure_layout_parent must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_ensure_layout_parent lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-projects-dir|calls|The base must already exist, otherwise a wrong base would be silently created.]].
