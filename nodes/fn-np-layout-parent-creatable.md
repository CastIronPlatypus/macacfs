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
  "name": "fn-np-layout-parent-creatable",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0259",
  "version": 1
}
-->

newproj_layout_parent_creatable is true when a missing parent lies under an existing, writable projects base, which lets the wizard accept <base>/<owner>/NAME before that folder exists. Within the flow it [[lf-newproj-projects-dir|serves|newproj_layout_parent_creatable performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_layout_parent_creatable must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_layout_parent_creatable lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-projects-dir|calls|Creation is allowed only beneath the resolved base, so a typo elsewhere still fails.]].
