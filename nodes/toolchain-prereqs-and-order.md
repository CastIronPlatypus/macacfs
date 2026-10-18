<!--stratified-action
{
  "created": 1789593708,
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
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0003",
  "version": 1
}
-->

Source-built tools need cargo/go/uv/node present before they build; on a fresh Mac that means Homebrew first, then toolchains. Ordering is a real constraint and the gate must install, not just report. Accomplished by [[install-experience|accomplished-by]].
