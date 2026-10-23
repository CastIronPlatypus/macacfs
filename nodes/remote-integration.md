<!--stratified-action
{
  "created": 1792790053,
  "edges": [
    {
      "dst": "req-newproj-github-optional",
      "reason": "gh/ru integration",
      "type": "validated-by"
    },
    {
      "dst": "ru-register",
      "reason": "The remote integration subsystem realizes ru registration.",
      "type": "serves"
    },
    {
      "dst": "req-newproj-ru-optional",
      "reason": "ru registration lives here",
      "type": "validated-by"
    },
    {
      "dst": "remote-code",
      "reason": "This code realizes the remote-integration subsystem.",
      "type": "accomplished-by"
    },
    {
      "dst": "ru-layout-paths",
      "reason": "newproj_remote.sh computes the ru-layout default paths",
      "type": "serves"
    },
    {
      "dst": "req-newproj-follows-ru-layout",
      "reason": "implements the layout resolver",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "remote-integration",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "subsystems",
  "uid": "n0109",
  "version": 1
}
-->

The remote-integration subsystem: shell functions shared by all newproj modes that resolve the GitHub/ru selection from flags and settings, preflight gh and ru, compute the owner-nested default directory, ensure an initial commit, run gh repo create and ru add, and print recovery commands on failure; the Python bootstrap calls the same preflight semantics natively. It [[github-publish|serves|The remote integration subsystem realizes GitHub publishing.]].
