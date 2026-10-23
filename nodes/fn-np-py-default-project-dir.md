<!--stratified-action
{
  "created": 1792795329,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-py-default-project-dir",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0271",
  "version": 1
}
-->

default_project_dir (Python) nests NAME under the owner, or under github.com and the owner, according to NEWPROJ_RU_LAYOUT, matching newproj_default_project_dir. Within the flow it [[lf-newproj-reviewed-remote|serves|default_project_dir (Python) performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-core|serves|default_project_dir (Python) must stay defined in fb-lib-newproj-core's file because its callers source that file.]], and its code is [[fb-lib-newproj-core-impl|accomplished-by|The concrete code of default_project_dir (Python) lives in the fb-lib-newproj-core-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-py-default-projects-dir|calls|The base must be the bash-resolved one, otherwise --plan and classic would disagree.]]; it [[fn-np-py-gh-owner|calls|owner-repo and full need the owner.]].
