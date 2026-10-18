<!--stratified-action
{
  "created": 1789593894,
  "disc_stamp": {
    "disc-callout-distal": "1.0.0",
    "disc-inline-link-prose": "1.0.0",
    "disc-obligation-audit": "1.0.0",
    "disc-precise-typed-edge": "1.0.0",
    "disc-prose-fidelity": "1.0.0",
    "disc-real-edge-reason": "1.0.0"
  },
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
    },
    {
      "dst": "req-fail-loud",
      "reason": "Running each step in isolation without aborting, then printing a \u2705/\u274c summary and returning non-zero on any failure, is the fail-loud spine.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "isolated-runner-reporter",
  "node_type": "unclassified",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "capabilities",
  "uid": "n0019",
  "version": 1
}
-->

The capability to run each step (each tool install/update, and each shell-setup component) in isolation, capturing its exit code and combined output without aborting the batch, keep a failing step's error tail and a passing step's note (e.g. re-signed paths), then print the ✅/❌ summary with counts and return non-zero if any step failed; under --dry-run each step is recorded as ok '(dry-run)' and the same table is rendered. It [[run-report-surface|serves|It is the fail-loud spine whose summary and exit code the run report surface shows.]] and [[shell-setup-experience|serves|Shell setup reuses the isolated runner and summary so each component (omz, p10k, font, brew bundle, tmux, atuin, zoxide, lazygit, ast-grep) reports success or failure independently.]], and it is [[result-capture-and-summary|accomplished-by|The result capture and summary subsystem realizes the isolated runs and the table.]].
