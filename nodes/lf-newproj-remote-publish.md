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
  "succeeds": "lf-newproj-remote-publish@v1",
  "uid": "n0233",
  "version": 2
}
-->

Commit, push and confirm registration: after the project has been scaffolded inside the remote-first clone, newproj_remote_finish runs newproj_remote_publish — initial commit if HEAD is missing, the public-repo scan, then git push -u origin HEAD to the repo created up front (a project with no origin, made before remote-first, still gets gh repo create --source=. --remote=origin --push) — and newproj_remote_ru, which returns at once when _newproj_ru_listed shows the repo already registered and otherwise runs ru add --from-cwd --non-interactive [--private], verified in ru list --json. Any failure keeps everything, prints the manual commands and returns 1, with no retry and no deletion. This flow [[fb-lib-newproj-remote|serves|The flow's code lives in lib/newproj/newproj_remote.sh.]]. It is carried out step by step by [[fn-np-remote-scan-public|accomplished-by|newproj_remote_scan_public checks public pushes.]], [[fn-np-remote-ensure-commit|accomplished-by|newproj_remote_ensure_commit makes the initial commit.]], [[fn-np-manual-hint|accomplished-by|_newproj_manual_hint prints how to finish.]], [[fn-np-remote-publish|accomplished-by|newproj_remote_publish pushes.]], [[fn-np-remote-ru|accomplished-by|newproj_remote_ru confirms or performs registration.]], [[fn-np-ru-listed|accomplished-by|_newproj_ru_listed makes registration idempotent.]] and [[fn-np-remote-finish|accomplished-by|newproj_remote_finish sequences it.]]. Related flows: [[lf-newproj-remote-clone|flow|It pushes from the clone that flow created.]].
