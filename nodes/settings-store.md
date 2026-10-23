<!--stratified-action
{
  "created": 1792790035,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "persistent settings",
      "type": "validated-by"
    },
    {
      "dst": "config-store",
      "reason": "The config store is the storage layer of the settings capability.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "settings-store",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0107",
  "version": 1
}
-->

The capability to read, validate, write and remove persistent key=value settings in ~/.config/macacfs/config (honoring XDG_CONFIG_HOME), with a fixed registry of known keys and allowed values, an env-var override per key, and effective-value lookup used by newproj. It [[config-surface|serves|The settings store backs everything the config verb shows and changes.]]. It is accomplished by [[config-store|accomplished-by|The config store is the storage layer of the settings capability.]].
