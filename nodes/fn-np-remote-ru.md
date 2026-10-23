<!--stratified-action
{
  "created": 1792795326,
  "edges": [
    {
      "dst": "req-newproj-never-deletes",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-remote-ru",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0267",
  "version": 1
}
-->

newproj_remote_ru runs 'ru add --from-cwd --non-interactive' (plus --private for a private repo) from the project, then requires OWNER/NAME in 'ru list --json'. Within the flow it [[lf-newproj-remote-publish|serves|newproj_remote_ru performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_remote_ru must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_remote_ru lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-remote-owner|calls|The ru list check looks for OWNER/NAME.]].
