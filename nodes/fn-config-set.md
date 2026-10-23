<!--stratified-action
{
  "created": 1792795312,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-config-set",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0246",
  "version": 1
}
-->

config_set validates, then rewrites the file through a mktemp sibling without the old KEY= line plus the new one, chmod 600 and mv, so a crash never leaves a half-written file. Within the flow it [[lf-config-verb|serves|config_set performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_set must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_set lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-validate|calls|Writing must be refused for an invalid value, otherwise newproj would later read garbage.]]; it [[fn-config-file|calls|The rewrite targets the single settings file.]].
