<!--stratified-action
{
  "created": 1792790074,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "python bootstrap code",
      "type": "validated-by"
    },
    {
      "dst": "req-newproj-github-optional",
      "reason": "adds gh steps to plans",
      "type": "validated-by"
    },
    {
      "dst": "fb-lib-newproj-core",
      "reason": "The embedded Python lives in newproj.sh.",
      "type": "accomplished-by"
    }
  ],
  "in_progress": false,
  "is_bead": false,
  "name": "bootstrap-py-code",
  "node_type": "impl",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0113",
  "version": 1
}
-->

Code unit: the Python program embedded in newproj.sh — templates, Agent Mail validation and registration, make_plan, read_plan, apply with checkpoints, guided, and argparse main — extended with the macOS projects-dir resolver, --github/--ru options and their commit/gh-create/ru-add commands with disclosed effects and a public-push personal-data scan. It [[newproj-engine|serves|This code is the reviewed-bootstrap part of the engine.]]. It is accomplished by [[fb-lib-newproj-core|accomplished-by|The embedded Python lives in newproj.sh.]].
