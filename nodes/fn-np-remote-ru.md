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
  "succeeds": "fn-np-remote-ru@v1",
  "uid": "n0267",
  "version": 2
}
-->

newproj_remote_ru DIR NAME returns at once unless ru is selected or when _newproj_ru_listed shows OWNER/NAME already registered (the remote-first clone registers it); otherwise it runs ru add --from-cwd --non-interactive [--private] in DIR and requires ru list --json to show the repo. Within the flow it [[lf-newproj-remote-publish|serves|It confirms or performs the registration.]]. It is defined in [[fb-lib-newproj-remote|serves|Defined in lib/newproj/newproj_remote.sh.]]. It [[fn-np-remote-owner|calls|For the owner.]] and [[fn-np-ru-listed|calls|To skip when already registered.]].
