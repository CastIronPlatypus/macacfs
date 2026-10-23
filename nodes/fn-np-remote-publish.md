<!--stratified-action
{
  "created": 1792795325,
  "edges": [
    {
      "dst": "req-newproj-never-deletes",
      "reason": "this function implements part of it",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-np-remote-publish",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0266",
  "version": 1
}
-->

newproj_remote_publish ensures a commit, scans a public repo, then runs 'gh repo create OWNER/NAME --private|--public --source=. --remote=origin --push', or only pushes when origin already exists. Within the flow it [[lf-newproj-remote-publish|serves|newproj_remote_publish performs one step of this flow, so the flow breaks if it is removed.]]. It is defined in the file boundary it [[fb-lib-newproj-remote|serves|newproj_remote_publish must stay defined in fb-lib-newproj-remote's file because its callers source that file.]], and its code is [[fb-lib-newproj-remote-impl|accomplished-by|The concrete code of newproj_remote_publish lives in the fb-lib-newproj-remote-impl implementation, so a change to it requires re-proving that node.]]. it [[fn-np-remote-owner|calls|The repo is created under the resolved owner.]]; it [[fn-np-remote-ensure-commit|calls|gh --push fails without HEAD.]]; it [[fn-np-remote-scan-public|calls|A public push must be refused when personal data would leak.]].
