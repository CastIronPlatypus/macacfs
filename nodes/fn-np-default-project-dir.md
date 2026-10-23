<!--stratified-action
{
  "created": 1792795320,
  "edges": [
    {
      "dst": "req-newproj-follows-ru-layout",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-default-project-dir",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0258",
  "version": 1
}
-->

newproj_default_project_dir prints base/NAME for flat, base/OWNER/NAME for owner-repo and base/github.com/OWNER/NAME for full, falling back to base/NAME when the layout or owner is unknown. Within the flow it [[lf-newproj-projects-dir|serves|newproj_default_project_dir performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_default_project_dir must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_default_project_dir lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-projects-dir|calls|The base comes from the shared resolver so all modes agree.]]; it [[fn-np-ru-layout|calls|The nesting depends on ru's layout, otherwise ru would clone a second copy elsewhere.]]; it [[fn-np-remote-owner|calls|owner-repo and full need the GitHub owner.]].
