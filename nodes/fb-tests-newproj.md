<!--stratified-action
{
  "created": 1792790098,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "ported + new tests",
      "type": "validated-by"
    },
    {
      "dst": "req-newproj-github-optional",
      "reason": "tests cover gh paths",
      "type": "validated-by"
    }
  ],
  "is_bead": true,
  "name": "fb-tests-newproj",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "file-boundaries",
  "uid": "n0121",
  "version": 1
}
-->

The tests/ file boundary: acfs newproj unit and e2e tests ported to macOS (bats + python unittest + expect) plus new tests for config, remote preflight/precedence with fake gh/ru, and the bash-version guard; run via tests/run.sh. Bead (tests). It [[newproj-engine|serves|The test suite verifies the engine.]].
