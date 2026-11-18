<!--stratified-action
{
  "created": 1792790098,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "completions for newproj flags",
      "type": "validated-by"
    }
  ],
  "in_progress": false,
  "is_bead": true,
  "name": "fb-share-completions",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "file-boundaries",
  "succeeds": "fb-share-completions@v1",
  "uid": "n0120",
  "version": 2
}
-->

The share/completions file boundary: _macacfs (zsh) and macacfs.bash completing verbs (including projinit and its flags), newproj flags (including --tools/--no-tools/--save-defaults) and config keys (including newproj.tools); the zsh one is put on fpath by the managed zshrc. Bead (data). It [[argv-code|serves|Completions mirror the verbs and flags the argv code accepts.]].
