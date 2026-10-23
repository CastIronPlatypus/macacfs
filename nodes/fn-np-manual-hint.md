<!--stratified-action
{
  "created": 1792795325,
  "edges": [
    {
      "dst": "req-newproj-never-deletes",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-manual-hint",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0265",
  "version": 1
}
-->

_newproj_manual_hint prints the cd, gh repo create and ru add commands that finish the job by hand. Within the flow it [[lf-newproj-remote-publish|serves|_newproj_manual_hint performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|_newproj_manual_hint must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of _newproj_manual_hint lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]].
