<!--stratified-action
{
  "created": 1792795319,
  "edges": [
    {
      "dst": "req-newproj-follows-ru-layout",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-ru-layout",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0256",
  "version": 1
}
-->

newproj_ru_layout prints ru's layout, or nothing, for bash callers and for NEWPROJ_RU_LAYOUT. Within the flow it [[lf-newproj-projects-dir|serves|newproj_ru_layout performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_ru_layout must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_ru_layout lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-ru-config|calls|The layout must be asked of ru itself rather than parsed from its file.]].
