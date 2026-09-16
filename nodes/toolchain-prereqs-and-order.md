<!--stratified-action
{
  "created": 1789593708,
  "edges": [
    {
      "dst": "install-experience",
      "reason": "The install flow triggers toolchain auto-install in order.",
      "type": "accomplished-by"
    }
  ],
  "is_bead": false,
  "name": "toolchain-prereqs-and-order",
  "node_type": "problem",
  "obligations": [
    "r-prereq-autoinstall"
  ],
  "status": "drafting",
  "stratum": "problem",
  "uid": "n0003",
  "version": 1
}
-->

Source-built tools need cargo/go/uv/node present before they build; on a fresh Mac that means Homebrew first, then toolchains. Ordering is a real constraint and the gate must install, not just report. Accomplished by [[install-experience|accomplished-by]].
