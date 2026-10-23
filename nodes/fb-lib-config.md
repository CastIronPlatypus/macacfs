<!--stratified-action
{
  "created": 1792790097,
  "edges": [
    {
      "dst": "req-persistent-settings",
      "reason": "lib/config.sh is the only file that reads or writes the settings file; if it is missing, 'macacfs config' and every newproj default fail.",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": true,
  "name": "fb-lib-config",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0119",
  "version": 1
}
-->

The lib/config.sh file boundary: the settings registry and config verb, sourced by bin/macacfs and by lib/newproj/newproj_remote.sh. Bead (code). It [[config-code|serves|This file holds the config code.]].
