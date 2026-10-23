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
  "name": "fn-config-validate",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0243",
  "version": 1
}
-->

config_validate accepts off|private|public for newproj.github, on|off for newproj.ru and an absolute path or empty for newproj.projects_dir, and prints an error and returns 1 for anything else, including unknown keys. Within the flow it [[lf-config-verb|serves|config_validate performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_validate must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_validate lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-known-keys|calls|The unknown-key error lists the known keys, so it depends on the registry.]].
