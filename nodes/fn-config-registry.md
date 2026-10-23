<!--stratified-action
{
  "created": 1792795307,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-config-registry",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0238",
  "version": 1
}
-->

config_registry prints the key|default|description table (newproj.github|off, newproj.ru|off, newproj.projects_dir|empty) that defines which keys exist. Within the flow it [[lf-config-verb|serves|config_registry performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_registry must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_registry lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]].
