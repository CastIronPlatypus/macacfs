<!--stratified-action
{
  "created": 1792795335,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-log-ts",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0280",
  "version": 1
}
-->

_newproj_log_ts prints HH:MM:SS.mmm from EPOCHREALTIME, because BSD date has no %N, and falls back to whole seconds. Within the flow it [[lf-newproj-classic-remote|serves|_newproj_log_ts performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-core|serves|_newproj_log_ts must stay defined in fb-lib-newproj-core's file because its callers source that file.]], and its code is [[fb-lib-newproj-core-impl|accomplished-by|The concrete code of _newproj_log_ts lives in the fb-lib-newproj-core-impl implementation, so a change to it requires re-proving that node.]].
