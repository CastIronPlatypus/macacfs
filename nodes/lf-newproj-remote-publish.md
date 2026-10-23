<!--stratified-action
{
  "created": 1792795285,
  "edges": [
    {
      "dst": "req-newproj-never-deletes",
      "reason": "this flow implements it",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "lf-newproj-remote-publish",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "logical-flow",
  "uid": "n0233",
  "version": 1
}
-->

Publish and register: after the local project exists, newproj_remote_finish runs newproj_remote_publish (initial commit if HEAD is missing, the public-repo scan, then gh repo create --source=. --remote=origin --push, or just a push when origin exists) and newproj_remote_ru (ru add --from-cwd --non-interactive [--private], verified in ru list --json). Any failure keeps everything, prints the manual commands and returns 1, with no retry and no deletion. This flow [[fb-lib-newproj-remote|serves|The flow's code must live in fb-lib-newproj-remote's file, so moving it elsewhere requires re-binding this flow.]]. It is carried out step by step by [[fn-np-remote-scan-public|accomplished-by|newproj_remote_scan_public performs one step of this flow, so removing it would break the flow.]], [[fn-np-remote-ensure-commit|accomplished-by|newproj_remote_ensure_commit performs one step of this flow, so removing it would break the flow.]], [[fn-np-manual-hint|accomplished-by|_newproj_manual_hint performs one step of this flow, so removing it would break the flow.]], [[fn-np-remote-publish|accomplished-by|newproj_remote_publish performs one step of this flow, so removing it would break the flow.]], [[fn-np-remote-ru|accomplished-by|newproj_remote_ru performs one step of this flow, so removing it would break the flow.]], [[fn-np-remote-finish|accomplished-by|newproj_remote_finish performs one step of this flow, so removing it would break the flow.]].
