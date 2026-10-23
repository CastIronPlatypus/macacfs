<!--stratified-action
{
  "created": 1792795333,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-py-remote-selection",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0277",
  "version": 1
}
-->

remote_selection (Python) validates github, ru and owner into the plan's remote object, and errors when --ru has no GitHub remote, the owner is unknown or there is no identity. Within the flow it [[lf-newproj-reviewed-remote|serves|remote_selection (Python) performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-core|serves|remote_selection (Python) must stay defined in fb-lib-newproj-core's file because its callers source that file.]], and its code is [[fb-lib-newproj-core-impl|accomplished-by|The concrete code of remote_selection (Python) lives in the fb-lib-newproj-core-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-py-git-identity|calls|The identity is frozen into the plan.]].
