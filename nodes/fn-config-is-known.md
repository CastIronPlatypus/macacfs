<!--stratified-action
{
  "created": 1792795309,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-config-is-known",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0241",
  "version": 1
}
-->

config_is_known returns 0 only for a registry key, so get and unset refuse typos. Within the flow it [[lf-config-verb|serves|config_is_known performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_is_known must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_is_known lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-known-keys|calls|Membership is tested against the registry key list, so an unregistered key cannot pass.]].
