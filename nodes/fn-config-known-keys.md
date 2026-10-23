<!--stratified-action
{
  "created": 1792795308,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-config-known-keys",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0239",
  "version": 1
}
-->

config_known_keys prints the key column of the registry. Within the flow it [[lf-config-verb|serves|config_known_keys performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_known_keys must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_known_keys lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-registry|calls|The key list must come from the registry, otherwise a new key would be settable but unlisted.]].
