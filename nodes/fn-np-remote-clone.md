<!--stratified-action
{
  "created": 1792869592,
  "edges": [
    {
      "dst": "req-newproj-remote-first",
      "reason": "this function is part of the remote-first order",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-np-remote-clone",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0309",
  "version": 1
}
-->

newproj_remote_clone NAME DEFAULT_DIR returns at once unless GitHub is selected; otherwise it resolves the owner, runs gh repo create OWNER/NAME --private|--public (failing with 'nothing was created'), sets NEWPROJ_GITHUB_URL, and with ru runs ru add OWNER/NAME --non-interactive [--private] and ru sync OWNER/NAME --clone-only --non-interactive and takes the directory from _newproj_ru_path, requiring a .git there; without ru it calls newproj_ensure_layout_parent and gh repo clone OWNER/NAME DIR -- -q. It points HEAD at refs/heads/main when there are no commits, sets NEWPROJ_CLONE_DIR, and on each failure prints what already exists and the command to finish. Within the flow it [[lf-newproj-remote-clone|serves|It drives the clone flow.]]. It is defined in [[fb-lib-newproj-remote|serves|Defined in lib/newproj/newproj_remote.sh.]]. It [[fn-np-remote-owner|calls|For the owner.]], [[fn-np-ru-path|calls|For ru's clone path.]] and [[fn-np-ensure-layout-parent|calls|Before gh repo clone.]].
