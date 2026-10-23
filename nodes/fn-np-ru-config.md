<!--stratified-action
{
  "created": 1792795318,
  "edges": [
    {
      "dst": "req-newproj-follows-ru-layout",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-ru-config",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0255",
  "version": 1
}
-->

newproj_ru_config runs 'ru config' once with stdin closed, parses its resolved PROJECTS_DIR= and LAYOUT= lines, keeps only an absolute dir and a flat|owner-repo|full layout, and fails when ru is absent or unclear. Within the flow it [[lf-newproj-projects-dir|serves|newproj_ru_config performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_ru_config must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_ru_config lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]].
