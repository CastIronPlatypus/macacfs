<!--stratified-action
{
  "created": 1792869593,
  "edges": [
    {
      "dst": "req-newproj-remote-first",
      "reason": "this function is part of the remote-first order",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-np-ru-path",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0310",
  "version": 1
}
-->

_newproj_ru_path OWNER/NAME pipes ru list --json into a python3 -I snippet that prints the path of the matching entry in data.repos, or nothing when the repo is not listed or the JSON does not parse. Within the flow it [[lf-newproj-remote-clone|serves|It reads where ru cloned the repo.]]. It is defined in [[fb-lib-newproj-remote|serves|Defined in lib/newproj/newproj_remote.sh.]].
