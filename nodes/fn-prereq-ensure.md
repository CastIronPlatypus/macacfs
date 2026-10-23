<!--stratified-action
{
  "created": 1792790690,
  "edges": [
    {
      "dst": "req-prerequisite-autoinstall",
      "reason": "it installs the toolchains the selected methods need",
      "type": "validated-by"
    }
  ],
  "is_bead": false,
  "name": "fn-prereq-ensure",
  "node_type": "impl",
  "status": "drafting",
  "stratum": "function-map",
  "uid": "n0165",
  "version": 1
}
-->

prereq_ensure <methods...> ensures Homebrew and git, then Rust for cargo-git or installer-sh, Go for go or installer-sh, and uv, node, minisign and flock for installer-sh, collecting failures in PREREQ_WARN; it prints what was installed, or that all were present, warns on stderr about anything missing, and always returns 0. Within the flow it [[lf-prereq-ensure|serves|prereq_ensure is one of the functions that carries out this flow.]]. It is defined in the file boundary it [[fb-lib-prereq|serves|prereq_ensure is defined in lib/prereq.sh.]], and its code is [[fb-lib-prereq-impl|accomplished-by|The concrete code of prereq_ensure lives in the lib/prereq.sh implementation.]]. It [[fn-ensure-homebrew|calls|Root prerequisite.]]; it [[fn-ensure-git|calls|Always ensured.]]; it [[fn-ensure-rust|calls|For cargo-git or installer-sh.]]; it [[fn-ensure-go|calls|For go or installer-sh.]]; it [[fn-ensure-uv|calls|For installer-sh.]]; it [[fn-ensure-node|calls|For installer-sh.]]; it [[fn-ensure-minisign|calls|For installer-sh.]]; it [[fn-ensure-flock|calls|For installer-sh.]].
