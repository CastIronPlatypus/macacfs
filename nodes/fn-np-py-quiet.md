<!--stratified-action
{
  "created": 1792795331,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-py-quiet",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0274",
  "version": 1
}
-->

quiet (Python) runs a probe with stdin closed, captured output and a timeout, and returns None on OSError. Within the flow it [[lf-newproj-reviewed-remote|serves|quiet (Python) performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-core|serves|quiet (Python) must stay defined in fb-lib-newproj-core's file because its callers source that file.]], and its code is [[fb-lib-newproj-core-impl|accomplished-by|The concrete code of quiet (Python) lives in the fb-lib-newproj-core-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-py-user-env|calls|Probes must see the user's gh auth.]].
