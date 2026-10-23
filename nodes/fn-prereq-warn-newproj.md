<!--stratified-action
{
  "created": 1792795336,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-prereq-warn-newproj",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0282",
  "version": 1
}
-->

prereq_warn_newproj prints one stderr note naming whichever of gh, ru, br and python3 >= 3.9 is missing. It never installs anything and always returns 0. Within the flow it [[lf-newproj-dispatch|serves|prereq_warn_newproj performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-prereq|serves|prereq_warn_newproj must stay defined in fb-lib-prereq's file because its callers source that file.]], and its code is [[fb-lib-prereq-impl|accomplished-by|The concrete code of prereq_warn_newproj lives in the fb-lib-prereq-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-have|calls|Presence is tested with _have.]].
