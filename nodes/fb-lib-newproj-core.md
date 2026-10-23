<!--stratified-action
{
  "created": 1792790094,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "core newproj files",
      "type": "validated-by"
    },
    {
      "dst": "bootstrap-py-code",
      "reason": "The embedded Python lives in newproj.sh.",
      "type": "serves"
    }
  ],
  "in_progress": false,
  "is_bead": true,
  "name": "fb-lib-newproj-core",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0116",
  "version": 1
}
-->

The lib/newproj/ core file boundary: newproj.sh (entry, classic main, embedded Python bootstrap), newproj_errors.sh, newproj_logging.sh, newproj_detect.sh, newproj_agents.sh and newproj_tui.sh, ported from acfs commit 0ae3ceb with provenance headers. Bead (code). It [[newproj-cli-code|serves|These files hold the classic CLI code.]]. It serves [[bootstrap-py-code|serves|The embedded Python lives in newproj.sh.]].
