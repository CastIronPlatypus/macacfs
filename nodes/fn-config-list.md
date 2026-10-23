<!--stratified-action
{
  "created": 1792795314,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-config-list",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0248",
  "version": 1
}
-->

config_list prints the file path and, for every registry key, its effective value, its source and its description. Within the flow it [[lf-config-verb|serves|config_list performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_list must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_list lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-effective|calls|Each row shows the effective value, so list must agree with what newproj will use.]]; it [[fn-config-registry|calls|Rows are enumerated from the registry so every key appears.]].
