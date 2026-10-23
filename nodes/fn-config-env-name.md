<!--stratified-action
{
  "created": 1792795310,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-config-env-name",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0242",
  "version": 1
}
-->

config_env_name maps a key to its override variable, e.g. newproj.github to MACACFS_NEWPROJ_GITHUB. Within the flow it [[lf-config-verb|serves|config_env_name performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_env_name must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_env_name lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]].
