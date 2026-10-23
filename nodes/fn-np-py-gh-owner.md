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
  "name": "fn-np-py-gh-owner",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0275",
  "version": 1
}
-->

gh_owner (Python) returns the explicit owner or the gh login, else None. Within the flow it [[lf-newproj-reviewed-remote|serves|gh_owner (Python) performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-core|serves|gh_owner (Python) must stay defined in fb-lib-newproj-core's file because its callers source that file.]], and its code is [[fb-lib-newproj-core-impl|accomplished-by|The concrete code of gh_owner (Python) lives in the fb-lib-newproj-core-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-py-quiet|calls|The login comes from a gh api probe.]].
