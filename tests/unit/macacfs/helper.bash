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
    # Remote-first: OWNER/NAME [--private|--public] creates an empty bare repo.
    # (With --source=. it also pushes, for projects created before remote-first.)
    [ "${FAKE_GH:-ok}" = createfail ] && { echo "HTTP 500" >&2; exit 1; }
    bare="$T/remotes/$3.git"; mkdir -p "$(dirname "$bare")"; git init -q --bare "$bare" || exit 1
    case " $* " in *" --source=. "*) git remote add origin "$bare" && git push -q -u origin HEAD; exit $? ;; esac
    exit 0 ;;
  "repo clone")
    [ "${FAKE_GH:-ok}" = clonefail ] && { echo "clone failed" >&2; exit 1; }
    git clone -q "$T/remotes/$3.git" "$4" 2>/dev/null; exit $? ;;
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
       if [ "$2" = --from-cwd ]; then repo="fakeuser/$(basename "$PWD")"; else repo="$2"; fi
       echo "$repo" >> "$T/ru.repos"; exit 0 ;;
  sync) # sync OWNER/NAME --clone-only: clone into ru's layout path
       [ "${FAKE_RU:-ok}" = syncfail ] && { echo "ru: sync failed" >&2; exit 1; }
       repo="$2"; base="${FAKE_RU_DIR:-$T/projects}"
       case "${FAKE_RU_LAYOUT:-flat}" in
         flat) dest="$base/${repo#*/}" ;; owner-repo) dest="$base/$repo" ;; full) dest="$base/github.com/$repo" ;;
       esac
       mkdir -p "$(dirname "$dest")"; git clone -q "$T/remotes/$repo.git" "$dest" 2>/dev/null; exit $? ;;
  list) # --json: repo + the path its layout gives it
       base="${FAKE_RU_DIR:-$T/projects}"
       printf '{"data":{"repos":['
       while read -r repo; do
         case "${FAKE_RU_LAYOUT:-flat}" in
           flat) p="$base/${repo#*/}" ;; owner-repo) p="$base/$repo" ;; full) p="$base/github.com/$repo" ;;
         esac
         printf '{"repo":"%s","path":"%s"},' "$repo" "$p"
       done < <(cat "$T/ru.repos" 2>/dev/null)
       printf '{}]}}\n'; exit 0 ;;
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
