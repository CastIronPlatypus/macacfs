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
  "name": "fn-config-file",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0237",
  "version": 1
}
-->

config_file prints ${XDG_CONFIG_HOME:-$HOME/.config}/macacfs/config, the one settings file every reader and writer uses. Within the flow it [[lf-config-verb|serves|config_file performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_file must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_file lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]].
