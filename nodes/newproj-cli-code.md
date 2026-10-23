<!--stratified-action
{
  "created": 1792790073,
  "edges": [
    {
      "dst": "req-newproj-acfs-parity",
      "reason": "classic CLI code",
      "type": "validated-by"
    },
    {
      "dst": "fb-lib-newproj-core",
      "reason": "These files hold the classic CLI code.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "newproj-cli-code",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "components",
  "uid": "n0111",
  "version": 1
}
-->

Code unit: newproj.sh's bash side — the reviewed-mode handoff guard, the bash-version guard, argument parsing for classic and interactive flags plus --github/--no-github/--github-owner/--ru/--no-ru, main() that validates, resolves the directory, scaffolds, commits and calls the remote steps, create_agents_template, run_interactive_mode, and the helpers in newproj_errors.sh, newproj_logging.sh, newproj_detect.sh and newproj_agents.sh. It [[newproj-engine|serves|This code is the classic-mode and launcher part of the engine.]].
