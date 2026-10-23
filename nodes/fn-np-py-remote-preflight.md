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
  "name": "fn-np-py-remote-preflight",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0278",
  "version": 1
}
-->

remote_preflight (Python) checks that gh is installed and authenticated, that ru is present when needed, and that OWNER/NAME answers 404, before guided creation or a fresh --apply. Within the flow it [[lf-newproj-reviewed-remote|serves|remote_preflight (Python) performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-core|serves|remote_preflight (Python) must stay defined in fb-lib-newproj-core's file because its callers source that file.]], and its code is [[fb-lib-newproj-core-impl|accomplished-by|The concrete code of remote_preflight (Python) lives in the fb-lib-newproj-core-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-py-quiet|calls|Each check is a quiet probe.]].
