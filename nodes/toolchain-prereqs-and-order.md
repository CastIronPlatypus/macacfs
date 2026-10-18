<!--stratified-action
{
  "created": 1789593708,
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
      "dst": "install-experience",
      "reason": "The install flow triggers toolchain auto-install in order.",
      "type": "accomplished-by"
    },
    {
      "dst": "req-prerequisite-autoinstall",
      "reason": "Source-built tools need cargo, go, uv, or node first, so on a fresh Mac Homebrew and toolchains must be installed in order, motivating an installing gate.",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "toolchain-prereqs-and-order",
  "node_type": "problem",
  "realized_at": "0.15.0",
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0003",
  "version": 1
}
-->

Source-built and installer-driven tools need cargo, go, uv or node (and some installers minisign or flock) present before they run; on a fresh Mac that means Homebrew first, then git and the toolchains, all before any tool installs. Ordering is a real constraint and the gate must install, not just report — yet a toolchain it cannot provide must not silently mask the failure: the tools that need it should fail loudly at their own step. The problem is [[install-experience|accomplished-by|The install flow runs the prereq gate first, installing Homebrew and then the needed toolchains before any tool.]]
