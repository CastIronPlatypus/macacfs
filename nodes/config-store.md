<!--stratified-action
{
  "created": 1792790054,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "settings file I/O",
      "type": "validated-by"
    },
    {
      "dst": "newproj-dispatch",
      "reason": "newproj reads its defaults through the config store.",
      "type": "serves"
    },
    {
      "dst": "config-code",
      "reason": "This code realizes the config store.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "config-store",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0110",
  "version": 1
}
-->

The config-store subsystem: lib/config.sh's registry of known keys (newproj.github, newproj.ru, newproj.projects_dir) with validators, file read/write with atomic replace, env overrides, and the config verb's get/set/unset/list handlers. It [[settings-store|serves|The config store is the storage layer of the settings capability.]].
