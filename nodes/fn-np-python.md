<!--stratified-action
{
  "created": 1792795327,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-python",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0269",
  "version": 1
}
-->

newproj_python prints the first python3 >= 3.9 among Homebrew's and PATH's, because the bootstrap needs Path.is_relative_to. Within the flow it [[lf-newproj-reviewed-remote|serves|newproj_python performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-core|serves|newproj_python must stay defined in fb-lib-newproj-core's file because its callers source that file.]], and its code is [[fb-lib-newproj-core-impl|accomplished-by|The concrete code of newproj_python lives in the fb-lib-newproj-core-impl implementation, so a change to it requires re-proving that node.]].
