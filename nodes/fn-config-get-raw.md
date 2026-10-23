<!--stratified-action
{
  "created": 1792795311,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-config-get-raw",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0244",
  "version": 1
}
-->

config_get_raw prints the last KEY= line's value from the file and returns 1 when the file or key is absent. Within the flow it [[lf-config-verb|serves|config_get_raw performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_get_raw must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_get_raw lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-file|calls|It must read the same file config_set writes, otherwise a set value would be invisible.]].
