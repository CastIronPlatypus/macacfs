<!--stratified-action
{
  "created": 1792795330,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-py-user-env",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0273",
  "version": 1
}
-->

user_env (Python) returns the caller's environment without GIT_DIR, GIT_WORK_TREE or GIT_INDEX variables, so gh, ru and git push see the user's credential helpers. Within the flow it [[lf-newproj-reviewed-remote|serves|user_env (Python) performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-core|serves|user_env (Python) must stay defined in fb-lib-newproj-core's file because its callers source that file.]], and its code is [[fb-lib-newproj-core-impl|accomplished-by|The concrete code of user_env (Python) lives in the fb-lib-newproj-core-impl implementation, so a change to it requires re-proving that node.]].
