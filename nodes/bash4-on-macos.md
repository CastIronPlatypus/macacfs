<!--stratified-action
{
  "created": 1792790002,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "the ported acfs scripts need bash 4.3+",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "bash4-on-macos",
  "node_type": "problem",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0098",
  "version": 1
}
-->

The acfs newproj scripts rely on bash 4.3+ features (declare -gA associative arrays, local -n namerefs, exec {fd}< dynamic descriptors, mapfile) and GNU userland (find -printf, date -Iseconds). macOS ships bash 3.2 at /bin/bash and BSD find/date, so a verbatim copy run by the system bash or relying on GNU flags breaks. The port must always execute under Homebrew bash (the same pinned interpreter bin/macacfs uses), refuse clearly under an older bash, and replace the GNU-only invocations with BSD/portable equivalents. The problem is [[newproj-experience|accomplished-by|newproj runs the ported scripts only under the pinned Homebrew bash with portable userland calls.]]
