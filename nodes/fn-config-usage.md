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
  "name": "fn-config-usage",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0249",
  "version": 1
}
-->

config_usage prints the verb syntax and each key with its description and default. Within the flow it [[lf-config-verb|serves|config_usage performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_usage must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_usage lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-registry|calls|The key help is generated from the registry so it cannot go stale.]].
