<!--stratified-action
{
  "created": 1792790096,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "newproj_remote.sh calls gh only when NEWPROJ_GITHUB is private or public, so a default run makes no gh call (test_remote.bats checks an empty gh log).",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": true,
  "name": "fb-lib-newproj-remote",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "succeeds": "fb-lib-newproj-remote@v1",
  "uid": "n0118",
  "version": 2
}
-->

The lib/newproj/newproj_remote.sh file boundary: gh/ru preflight, the remote-first clone (create the empty repo, ru or gh clone), publish (commit and push) and register functions sourced by newproj.sh and the progress screen. Bead (code). It [[remote-code|serves|This file holds the remote code.]].
