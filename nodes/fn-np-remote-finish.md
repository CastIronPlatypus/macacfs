<!--stratified-action
{
  "created": 1792795327,
  "edges": [
    {
      "dst": "req-newproj-never-deletes",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-remote-finish",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0268",
  "version": 1
}
-->

newproj_remote_finish publishes, then registers with ru. On a failure it keeps the project, prints the manual commands and returns 1, never retrying or deleting. Within the flow it [[lf-newproj-remote-publish|serves|newproj_remote_finish performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_remote_finish must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_remote_finish lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-remote-publish|calls|GitHub comes first because ru needs the remote.]]; it [[fn-np-remote-ru|calls|Registration runs only after a successful publish.]]; it [[fn-np-manual-hint|calls|A failure must leave the user with the commands to finish.]].
