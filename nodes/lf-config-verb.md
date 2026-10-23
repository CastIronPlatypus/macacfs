<!--stratified-action
{
  "created": 1792795282,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "this flow implements it",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "lf-config-verb",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0228",
  "version": 1
}
-->

Settings verb: 'macacfs config' reaches config_main, which lists every key with its effective value and source, prints one key's effective value (env MACACFS_<KEY>, else the XDG file, else the default), validates and atomically rewrites the file on set, removes a key on unset, and exits 2 on misuse. newproj reads the same values through config_effective, so what 'config list' shows is what newproj uses. This flow [[fb-lib-config|serves|The flow's code must live in fb-lib-config's file, so moving it elsewhere requires re-binding this flow.]]. It is carried out step by step by [[fn-config-file|accomplished-by|config_file performs one step of this flow, so removing it would break the flow.]], [[fn-config-registry|accomplished-by|config_registry performs one step of this flow, so removing it would break the flow.]], [[fn-config-known-keys|accomplished-by|config_known_keys performs one step of this flow, so removing it would break the flow.]], [[fn-config-default|accomplished-by|config_default performs one step of this flow, so removing it would break the flow.]], [[fn-config-is-known|accomplished-by|config_is_known performs one step of this flow, so removing it would break the flow.]], [[fn-config-env-name|accomplished-by|config_env_name performs one step of this flow, so removing it would break the flow.]], [[fn-config-validate|accomplished-by|config_validate performs one step of this flow, so removing it would break the flow.]], [[fn-config-get-raw|accomplished-by|config_get_raw performs one step of this flow, so removing it would break the flow.]], [[fn-config-effective|accomplished-by|config_effective performs one step of this flow, so removing it would break the flow.]], [[fn-config-set|accomplished-by|config_set performs one step of this flow, so removing it would break the flow.]], [[fn-config-unset|accomplished-by|config_unset performs one step of this flow, so removing it would break the flow.]], [[fn-config-list|accomplished-by|config_list performs one step of this flow, so removing it would break the flow.]], [[fn-config-usage|accomplished-by|config_usage performs one step of this flow, so removing it would break the flow.]], [[fn-config-main|accomplished-by|config_main performs one step of this flow, so removing it would break the flow.]]. Related flows: [[lf-newproj-remote-selection|flow|newproj_remote_init_defaults reads newproj.github and newproj.ru through this flow's config_effective, so a set value changes the next newproj run.]]. It is entered from [[fn-main|accomplished-by|main's config branch calls config_main and exits with its status, so without it 'macacfs config' would print usage and exit 2.]].
