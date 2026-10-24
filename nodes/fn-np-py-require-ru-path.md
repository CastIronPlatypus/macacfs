<!--stratified-action
{
  "created": 1792869595,
  "edges": [
    {
      "dst": "req-newproj-remote-first",
      "reason": "this function is part of the remote-first order",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fn-np-py-require-ru-path",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0314",
  "version": 1
}
-->

require_ru_path(directory, remote, name) (Python) raises when ru is selected and the directory differs from default_project_dir(name, owner), ru's layout path, telling the user to drop the directory argument or use --no-ru. Within the flow it [[lf-newproj-reviewed-remote|serves|It pins --plan and --guided to ru's path.]]. It is defined in [[fb-lib-newproj-core|serves|Defined in lib/newproj/newproj.sh's embedded Python.]]. It [[fn-np-py-default-project-dir|calls|For ru's path.]].
