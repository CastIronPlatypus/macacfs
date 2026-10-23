<!--stratified-action
{
  "created": 1792795319,
  "edges": [
    {
      "dst": "req-newproj-follows-ru-layout",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-projects-dir",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0257",
  "version": 1
}
-->

newproj_projects_dir prints MACACFS_PROJECTS_DIR, else ACFS_PROJECTS_DIR, else the newproj.projects_dir setting, else ru's PROJECTS_DIR, else /data/projects when it exists, else ~/Projects. Within the flow it [[lf-newproj-projects-dir|serves|newproj_projects_dir performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_projects_dir must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_projects_dir lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-config-effective|calls|The setting sits between the env overrides and ru in the fallback order.]]; it [[fn-np-ru-config|calls|ru's PROJECTS_DIR is the base whenever no override is set.]].
