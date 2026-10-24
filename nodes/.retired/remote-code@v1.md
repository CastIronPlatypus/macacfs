<!--stratified-action
{
  "created": 1792790075,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "remote shell code",
      "type": "validated-by"
    },
    {
      "dst": "fb-lib-newproj-remote",
      "reason": "This file holds the remote code.",
      "type": "accomplished-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "remote-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "retire_reason": "adds newproj_remote_clone and the ru path helpers",
  "retired_at": 1792869687,
  "status": "retired",
  "stratum": "components",
  "uid": "n0114",
  "version": 1
}
-->

Code unit: newproj_remote.sh — newproj_remote_resolve (flags/settings), newproj_remote_preflight, newproj_remote_owner, newproj_remote_default_dir, newproj_remote_scan_public, newproj_remote_publish and newproj_remote_ru. It [[remote-integration|serves|This code realizes the remote-integration subsystem.]]. It is accomplished by [[fb-lib-newproj-remote|accomplished-by|This file holds the remote code.]].
