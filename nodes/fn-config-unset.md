<!--stratified-action
{
  "created": 1792795313,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-config-unset",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0247",
  "version": 1
}
-->

config_unset removes a known key's line the same atomic way and succeeds when the file does not exist. Within the flow it [[lf-config-verb|serves|config_unset performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_unset must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_unset lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-is-known|calls|Unsetting an unknown key must fail loudly instead of silently doing nothing.]]; it [[fn-config-file|calls|The rewrite targets the single settings file.]].
