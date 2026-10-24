# tests/isolate.bash — sourced by tests/run.sh and every test helper.
# A test must never see the user's real macacfs settings or reach their real
# GitHub/ru accounts: with an empty config dir newproj.github/newproj.ru
# default to off, and with empty gh/ru config a real gh or ru on PATH is
# unauthenticated / has no repos. Tests that exercise gh/ru use fakes on PATH.
_MACACFS_ISO="${BATS_RUN_TMPDIR:-${TMPDIR:-/tmp}}/macacfs-iso.$$"
mkdir -p "$_MACACFS_ISO/xdg/ru" "$_MACACFS_ISO/gh"
export XDG_CONFIG_HOME="$_MACACFS_ISO/xdg" GH_CONFIG_DIR="$_MACACFS_ISO/gh" RU_CONFIG_DIR="$_MACACFS_ISO/xdg/ru"
unset MACACFS_NEWPROJ_GITHUB MACACFS_NEWPROJ_RU GH_TOKEN GITHUB_TOKEN
