#!/usr/bin/env bash
# install.sh — one-liner bootstrap for macacfs.
#   curl -fsSL https://raw.githubusercontent.com/CastIronPlatypus/macacfs/main/install.sh | bash
# Clones macacfs to ~/.macacfs and links the CLI onto ~/.local/bin.
# Realizes: fb-install-sh (self-update / bootstrap).

set -euo pipefail

REPO_URL="${MACACFS_REPO_URL:-https://github.com/CastIronPlatypus/macacfs.git}"
PREFIX="${MACACFS_HOME:-$HOME/.macacfs}"
BINDIR="$HOME/.local/bin"
BINLINK="$BINDIR/macacfs"

if [ "$(uname -s)" != "Darwin" ]; then
  printf 'macacfs is macOS-only (detected %s). Aborting.\n' "$(uname -s)" >&2
  exit 1
fi

command -v git >/dev/null 2>&1 || {
  printf 'macacfs bootstrap needs git. Install the Xcode Command Line Tools (xcode-select --install) and retry.\n' >&2
  exit 1
}

mkdir -p "$BINDIR"

if [ -d "$PREFIX/.git" ]; then
  printf 'Updating existing macacfs checkout at %s ...\n' "$PREFIX"
  git -C "$PREFIX" pull --ff-only
else
  printf 'Cloning macacfs into %s ...\n' "$PREFIX"
  rm -rf "$PREFIX"
  git clone --depth 1 "$REPO_URL" "$PREFIX"
fi

chmod +x "$PREFIX/bin/macacfs"
ln -sf "$PREFIX/bin/macacfs" "$BINLINK"

printf '\nmacacfs installed: %s -> %s\n' "$BINLINK" "$PREFIX/bin/macacfs"
case ":$PATH:" in
  *":$BINDIR:"*) : ;;
  *) printf '\nAdd this to your shell profile so "macacfs" is found:\n  export PATH="%s:$PATH"\n' "$BINDIR" ;;
esac
printf '\nNext:\n  macacfs install         # install all the tools\n  macacfs schedule        # weekly auto-updates\n'
