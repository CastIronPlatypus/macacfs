<!--stratified-action
{
  "created": 1792790076,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "config_set writes newproj.* to the XDG file and config_effective returns env over file over default, which is the precedence the requirement's acceptance test checks.",
      "type": "validated-by"
    },
    {
      "dst": "fb-lib-config",
      "reason": "This file holds the config code.",
      "type": "accomplished-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "config-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0115",
  "version": 1
}
-->

Code unit: lib/config.sh — config_file, config_known_keys, config_validate, config_get_raw, config_effective, config_set, config_unset, config_list and config_main. It [[config-store|serves|This code realizes the config store.]]. It is accomplished by [[fb-lib-config|accomplished-by|This file holds the config code.]].
