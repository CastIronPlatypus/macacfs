<!--stratified-action
{
  "created": 1792795328,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-py-default-projects-dir",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0270",
  "version": 1
}
-->

default_projects_dir (Python) returns NEWPROJ_DEFAULT_PROJECTS_DIR from bash, falling back to ACFS_PROJECTS_DIR, /data/projects or ~/Projects only when it is run outside newproj.sh. Within the flow it [[lf-newproj-reviewed-remote|serves|default_projects_dir (Python) performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-core|serves|default_projects_dir (Python) must stay defined in fb-lib-newproj-core's file because its callers source that file.]], and its code is [[fb-lib-newproj-core-impl|accomplished-by|The concrete code of default_projects_dir (Python) lives in the fb-lib-newproj-core-impl implementation, so a change to it requires re-proving that node.]].
