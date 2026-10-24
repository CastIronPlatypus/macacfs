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
  "succeeds": "fn-np-remote-publish@v1",
  "uid": "n0266",
  "version": 2
}
-->

newproj_remote_publish DIR NAME returns at once unless GitHub is selected; it resolves the owner, makes the initial commit via newproj_remote_ensure_commit, runs the public-repo scan, then — in the remote-first order, where origin already points at the repo created and cloned up front — pushes with git push -q -u origin HEAD; only when there is no origin does it fall back to gh repo create OWNER/NAME --private|--public --source=. --remote=origin --push. It sets NEWPROJ_GITHUB_URL. Within the flow it [[lf-newproj-remote-publish|serves|It is the push step.]]. It is defined in [[fb-lib-newproj-remote|serves|Defined in lib/newproj/newproj_remote.sh.]]. It [[fn-np-remote-owner|calls|For the owner.]], [[fn-np-remote-ensure-commit|calls|For the initial commit.]] and [[fn-np-remote-scan-public|calls|For the public scan.]].
