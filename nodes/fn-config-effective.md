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
  "name": "fn-config-effective",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0245",
  "version": 1
}
-->

config_effective returns the env override, else the file value, else the default, with -s also naming the source; newproj reads every setting through it. Within the flow it [[lf-config-verb|serves|config_effective performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_effective must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_effective lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-env-name|calls|The env override must be checked first, because env outranks the file.]]; it [[fn-config-get-raw|calls|The file value is used only when no env override is set.]]; it [[fn-config-default|calls|The default applies only when neither env nor file has the key.]].
