<!--stratified-action
{
  "created": 1792795334,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-py-scan-public",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0279",
  "version": 1
}
-->

scan_public (Python) refuses a public plan when a planned file contains the home path or a secret pattern. Within the flow it [[lf-newproj-reviewed-remote|serves|scan_public (Python) performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-core|serves|scan_public (Python) must stay defined in fb-lib-newproj-core's file because its callers source that file.]], and its code is [[fb-lib-newproj-core-impl|accomplished-by|The concrete code of scan_public (Python) lives in the fb-lib-newproj-core-impl implementation, so a change to it requires re-proving that node.]].
