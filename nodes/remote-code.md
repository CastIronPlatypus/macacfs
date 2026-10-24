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
  "status": "drafting",
  "stratum": "components",
  "succeeds": "remote-code@v1",
  "uid": "n0114",
  "version": 2
}
-->

Code unit: newproj_remote.sh — newproj_remote_resolve (flags/settings), newproj_remote_preflight, newproj_remote_owner, newproj_remote_default_dir, newproj_remote_clone (create the empty repo, then ru add + ru sync or gh repo clone), _newproj_ru_path and _newproj_ru_listed, newproj_is_fresh_clone, newproj_remote_scan_public, newproj_remote_publish (commit and push from the clone) and newproj_remote_ru. It [[remote-integration|serves|This code realizes the remote-integration subsystem.]]. It is accomplished by [[fb-lib-newproj-remote|accomplished-by|This file holds the remote code.]].
