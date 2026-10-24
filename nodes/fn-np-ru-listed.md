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
  "name": "fn-np-ru-listed",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0311",
  "version": 1
}
-->

_newproj_ru_listed OWNER/NAME succeeds when _newproj_ru_path returns a path, i.e. ru already has the repo registered. Within the flow it [[lf-newproj-remote-publish|serves|It makes the late registration step a no-op after the remote-first clone.]]. It is defined in [[fb-lib-newproj-remote|serves|Defined in lib/newproj/newproj_remote.sh.]]. It [[fn-np-ru-path|calls|For the lookup.]].
