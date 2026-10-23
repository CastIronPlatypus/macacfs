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
  "name": "fn-config-default",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0240",
  "version": 1
}
-->

config_default prints a key's registry default. Within the flow it [[lf-config-verb|serves|config_default performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_default must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_default lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-registry|calls|Defaults must be read from the registry so config list and config get cannot drift apart.]].
