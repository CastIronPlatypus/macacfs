<!--stratified-action
{
  "created": 1792790031,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "routes newproj into its three modes",
      "type": "validated-by"
    },
    {
      "dst": "cli-arg-dispatch",
      "reason": "it receives newproj argv from the top-level dispatcher",
      "type": "serves"
    },
    {
      "dst": "req-persistent-settings",
      "reason": "resolves setting defaults",
      "type": "validated-by"
    },
    {
      "dst": "newproj-engine",
      "reason": "The engine is where the dispatcher sends each mode.",
      "type": "accomplished-by"
    },
    {
      "dst": "config-store",
      "reason": "newproj reads its defaults through the config store.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "newproj-dispatch",
  "node_type": "unclassified",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0101",
  "version": 1
}
-->

The capability to take 'macacfs newproj ARGS' and route it: --plan/--apply/--guided go to the Python reviewed bootstrap, -i/--interactive to the wizard, anything else to the classic CLI; GitHub/ru flags and their persistent-setting defaults are resolved once (flag > env > config > off) and passed to whichever mode runs, and unknown options fail with usage. It [[newproj-experience|serves|Routing every newproj invocation to the right mode is how the whole newproj experience is delivered.]].
