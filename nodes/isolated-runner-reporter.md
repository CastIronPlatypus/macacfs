<!--stratified-action
{
  "created": 1789593894,
  "edges": [
    {
      "dst": "run-report-surface",
      "reason": "The observed summary and exit code are produced by the isolated runner/reporter.",
      "type": "serves"
    },
    {
      "dst": "result-capture-and-summary",
      "reason": "The runner/reporter is built from capture + summary.",
      "type": "accomplished-by"
    },
    {
      "dst": "shell-setup-experience",
      "reason": "Shell setup reuses the isolated runner + summary so each component (omz, p10k, font, brew bundle, atuin, zoxide, lazygit) reports success/failure independently.",
      "type": "serves"
    }
  ],
  "is_bead": false,
  "name": "isolated-runner-reporter",
  "node_type": "unclassified",
  "obligations": [
    "r-fail-loud"
  ],
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0019",
  "version": 1
}
-->

Runs each per-tool step in isolation, capturing exit code and stderr without aborting the batch, then prints the ✅/❌ summary and returns non-zero if any failed. The fail-loud spine that [[run-report-surface|flow]] shows; also renders the dry-run table. Accomplished by [[result-capture-and-summary|accomplished-by]].
