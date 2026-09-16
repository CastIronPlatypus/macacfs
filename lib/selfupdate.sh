#!/usr/bin/env bash
# lib/selfupdate.sh — update macacfs itself from its public repo.
# Realizes: repo-fetch-replace / selfupdate-code.
#
# If MACACFS_HOME is a git checkout, fast-forward it. Otherwise re-clone into a
# temp dir and swap it into place atomically (write-new, mv-old-aside, mv-new-in).

# Canonical repo URL; overridden by the live origin remote when present.
MACACFS_REPO_URL="${MACACFS_REPO_URL:-https://github.com/CastIronPlatypus/macacfs.git}"

selfupdate_run() {
  if [ "${DRY_RUN:-0}" = 1 ]; then
    if [ -d "$MACACFS_HOME/.git" ]; then
      printf '    [dry-run] git -C %s pull --ff-only\n' "$MACACFS_HOME"
    else
      printf '    [dry-run] re-clone %s over %s\n' "$MACACFS_REPO_URL" "$MACACFS_HOME"
    fi
    return 0
  fi

  if [ -d "$MACACFS_HOME/.git" ]; then
    local url
    url="$(git -C "$MACACFS_HOME" remote get-url origin 2>/dev/null || echo "$MACACFS_REPO_URL")"
    printf 'Updating macacfs from %s ...\n' "$url"
    git -C "$MACACFS_HOME" pull --ff-only || {
      printf 'macacfs: self-update failed (git pull). Resolve the checkout at %s and retry.\n' "$MACACFS_HOME" >&2
      return 1
    }
  else
    printf 'Re-cloning macacfs from %s ...\n' "$MACACFS_REPO_URL"
    local tmp
    tmp="$(mktemp -d -t macacfs.selfupdate.XXXXXX)"
    git clone --depth 1 "$MACACFS_REPO_URL" "$tmp/macacfs" || { rm -rf "$tmp"; return 1; }
    # Atomic-ish swap: move old aside, move new in, then drop old.
    local backup="$MACACFS_HOME.bak.$$"
    mv "$MACACFS_HOME" "$backup" && mv "$tmp/macacfs" "$MACACFS_HOME" || {
      printf 'macacfs: self-update swap failed; original preserved at %s\n' "$backup" >&2
      rm -rf "$tmp"; return 1
    }
    rm -rf "$backup" "$tmp"
  fi
  chmod +x "$MACACFS_HOME/bin/macacfs" 2>/dev/null || true
  printf 'macacfs updated -> %s\n' "$(cat "$MACACFS_HOME/VERSION" 2>/dev/null || echo unknown)"
}
