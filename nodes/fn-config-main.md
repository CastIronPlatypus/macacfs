<!--stratified-action
{
  "created": 1792795315,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-config-main",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0250",
  "version": 1
}
-->

config_main dispatches list (the default), get, set, unset and help, checks argument counts (exit 2 on misuse) and rejects unknown subcommands with exit 2. Within the flow it [[lf-config-verb|serves|config_main performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-config|serves|config_main must stay defined in fb-lib-config's file because its callers source that file.]], and its code is [[fb-lib-config-impl|accomplished-by|The concrete code of config_main lives in the fb-lib-config-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-list|calls|list prints all settings.]]; it [[fn-config-effective|calls|get prints the effective value.]]; it [[fn-config-set|calls|set validates and writes.]]; it [[fn-config-unset|calls|unset removes a key.]]; it [[fn-config-usage|calls|help and misuse print usage.]].
