# Shared setup for macacfs-specific newproj tests: an isolated HOME/XDG/git
# identity and fake gh/ru executables on PATH (no network, no real accounts).
REPO_ROOT="$(cd "$BATS_TEST_DIRNAME/../../.." && pwd)"
# shellcheck source=../../isolate.bash
. "$REPO_ROOT/tests/isolate.bash"
NEWPROJ="$REPO_ROOT/lib/newproj/newproj.sh"

mk_fakes() {
  FAKEBIN="$T/bin"; mkdir -p "$FAKEBIN"
  # gh: FAKE_GH=unauth|taken|createfail|ok ; logs every call to $T/gh.log
  cat > "$FAKEBIN/gh" <<'GH'
#!/bin/bash
echo "gh $*" >> "$T/gh.log"
case "$1 $2" in
  "auth status") [ "${FAKE_GH:-ok}" = unauth ] && { echo "not logged in" >&2; exit 1; }; exit 0 ;;
  "api user") echo fakeuser; exit 0 ;;
  "repo create")
    [ "${FAKE_GH:-ok}" = createfail ] && { echo "HTTP 500" >&2; exit 1; }
    git init -q --bare "$T/remote.git" && git remote add origin "$T/remote.git" && git push -q -u origin HEAD; exit $? ;;
esac
if [ "$1" = api ]; then
  [ "${FAKE_GH:-ok}" = taken ] && { echo '{"full_name":"x"}'; exit 0; }
  echo "gh: Not Found (HTTP 404)" >&2; exit 1
fi
exit 0
GH
  # ru: FAKE_RU_LAYOUT=flat|owner-repo|full, FAKE_RU_DIR, FAKE_RU=addfail
  cat > "$FAKEBIN/ru" <<'RU'
#!/bin/bash
echo "ru $*" >> "$T/ru.log"
case "$1" in
  config) { echo "Configuration (resolved):"; echo "  PROJECTS_DIR=${FAKE_RU_DIR:-$T/projects}"; echo "  LAYOUT=${FAKE_RU_LAYOUT:-flat}"; } >&2; exit 0 ;;
  add) [ "${FAKE_RU:-ok}" = addfail ] && { echo "ru: add failed" >&2; exit 1; }
       r="$(git remote get-url origin)"; echo "fakeuser/$(basename "$PWD")" >> "$T/ru.repos"; exit 0 ;;
  list) printf '{"data":{"repos":['; sed 's/.*/{"repo":"&"},/' "$T/ru.repos" 2>/dev/null | tr -d '\n'; printf '{}]}}\n'; exit 0 ;;
esac
exit 0
RU
  chmod +x "$FAKEBIN/gh" "$FAKEBIN/ru"
}

common_setup() {
  T="$(cd "$(mktemp -d "${TMPDIR:-/tmp}/macacfs-test-XXXXXX")" && pwd -P)"; export T
  export HOME="$T/home" XDG_CONFIG_HOME="$T/xdg"; mkdir -p "$HOME" "$T/projects"
  export GIT_CONFIG_GLOBAL="$T/gitconfig" GIT_CONFIG_NOSYSTEM=1
  printf '[user]\n\tname = Test User\n\temail = test@example.com\n[init]\n\tdefaultBranch = main\n' > "$GIT_CONFIG_GLOBAL"
  mk_fakes
  # brew bash + system tools + fakes; deliberately no real gh/ru/br.
  export PATH="$FAKEBIN:/opt/homebrew/opt/python@3/libexec/bin:/usr/bin:/bin"
  BASH4=/opt/homebrew/bin/bash
  unset MACACFS_PROJECTS_DIR ACFS_PROJECTS_DIR MACACFS_NEWPROJ_GITHUB MACACFS_NEWPROJ_RU MACACFS_NEWPROJ_PROJECTS_DIR
}

common_teardown() { [ -n "${T:-}" ] && rm -rf "$T"; }

# Run classic newproj outside bats' test-mode tmp redirect.
np() { env -u BATS_TEST_NAME -u ACFS_TEST_MODE "$BASH4" "$NEWPROJ" "$@"; }
