<!--stratified-action
{
  "created": 1792795316,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-remote-init-defaults",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0252",
  "version": 1
}
-->

newproj_remote_init_defaults fills NEWPROJ_GITHUB and NEWPROJ_RU that no flag set from config_effective (env, then file, then off), coerces bad values to off and exports them for the wizard and the Python side. Within the flow it [[lf-newproj-remote-selection|serves|newproj_remote_init_defaults performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_remote_init_defaults must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_remote_init_defaults lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-effective|calls|Unset selections must come from the settings precedence, otherwise newproj.github=private would be ignored.]].
