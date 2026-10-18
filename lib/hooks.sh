#!/usr/bin/env bash
# lib/hooks.sh — per-tool pre-install hooks, run by dispatch_row before a
# tool's install method. A hook is a function named pre_install_<ABBR>; it may
# set HOOK_ENV (VAR=value words for the installer's environment) and
# HOOK_EXTRA_ARGS (extra installer args). A failing hook fails the tool.
# Realizes: tool-install-hooks / fb-lib-hooks.

# MDWB (markdown_web_browser): its installer only fetches Chrome for Testing on
# Linux x86_64, then its self-test fails on a Mac without the exact build. So
# always download the build MDWB will test — without looking at what is already
# installed — and hand the installer CFT_VERSION/CFT_EXECUTABLE for it. Also pin
# --dir: the installer's default is ./markdown_web_browser under whatever
# directory macacfs happens to run from.
pre_install_MDWB() {
  local dir="$HOME/markdown_web_browser" build arch cache zip app
  # The build MDWB tests: CFT_VERSION from the environment, else its .env, else
  # the installer's verified pin.
  build="${CFT_VERSION:-}"
  if [ -z "$build" ] && [ -f "$dir/.env" ]; then
    build="$(sed -n 's/^CFT_VERSION=//p' "$dir/.env" | tail -n 1)"
  fi
  if [ -z "$build" ]; then
    build="$(curl -fsSL "$RAW_BASE/markdown_web_browser/main/install.sh" | sed -n 's/^readonly CFT_PINNED_BUILD="\(.*\)"$/\1/p')"
  fi
  build="${build#chrome-}"
  case "$build" in
    *.*.*.*) : ;;
    *) printf 'macacfs: could not determine the Chrome for Testing build MDWB tests (got "%s")\n' "$build" >&2; return 1 ;;
  esac
  case "$(uname -m)" in
    arm64) arch=mac-arm64 ;;
    x86_64) arch=mac-x64 ;;
    *) printf 'macacfs: no Chrome for Testing build for %s\n' "$(uname -m)" >&2; return 1 ;;
  esac
  cache="$HOME/.cache/mdwb/cft/$build"
  zip="$(mktemp -t macacfs.cft.XXXXXX)"
  printf '    downloading Chrome for Testing %s (%s)\n' "$build" "$arch"
  curl -fL "https://storage.googleapis.com/chrome-for-testing-public/$build/$arch/chrome-$arch.zip" -o "$zip" \
    || { rm -f "$zip"; printf 'macacfs: Chrome for Testing %s download failed\n' "$build" >&2; return 1; }
  rm -rf "$cache/chrome-$arch"
  mkdir -p "$cache"
  unzip -q -o "$zip" -d "$cache" || { rm -f "$zip"; printf 'macacfs: could not unpack Chrome for Testing %s\n' "$build" >&2; return 1; }
  rm -f "$zip"
  app="$cache/chrome-$arch/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing"
  [ -x "$app" ] || { printf 'macacfs: Chrome for Testing executable missing after unpack: %s\n' "$app" >&2; return 1; }
  HOOK_ENV=("CFT_VERSION=$build" "CFT_EXECUTABLE=$app")
  HOOK_EXTRA_ARGS=(--dir "$dir")
}
