#!/opt/homebrew/bin/bash
# tests/run.sh — run the macacfs test suites under Homebrew bash.
#   tests/run.sh            unit (bats + python) and macacfs tests
#   tests/run.sh --e2e      also the expect-driven wizard e2e tests (slow)
# Needs: brew install bats-core expect python  (python tests are unittest scripts)
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export PATH="/opt/homebrew/bin:$PATH"
command -v bats >/dev/null || { echo "bats missing: brew install bats-core" >&2; exit 2; }
rc=0
echo "== bats: newproj unit + lib + macacfs"
bats "$ROOT/tests/unit/newproj" "$ROOT/tests/unit/lib" "$ROOT/tests/unit/macacfs" || rc=1
echo "== python: bootstrap, creation recovery, ntm launch"
for f in "$ROOT"/tests/unit/test_project_bootstrap.py "$ROOT"/tests/unit/newproj/test_*.py; do
  (cd "$ROOT" && python3 "$f") || rc=1
done
if [ "${1:-}" = --e2e ]; then
  command -v expect >/dev/null || { echo "expect missing: brew install expect" >&2; exit 2; }
  echo "== bats: e2e (expect)"
  bats "$ROOT/tests/e2e" || rc=1
fi
exit "$rc"
