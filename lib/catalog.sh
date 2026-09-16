#!/usr/bin/env bash
# lib/catalog.sh — load and query the tool manifest.
# Realizes: manifest-store / catalog-loader-code.

# Path to the manifest, set by bin/macacfs (MACACFS_HOME/share/manifest.tsv).
: "${MACACFS_MANIFEST:?MACACFS_MANIFEST must be set before sourcing catalog.sh}"

# Strip comments and blank lines; emit real rows only.
catalog_rows() {
  grep -vE '^[[:space:]]*(#|$)' "$MACACFS_MANIFEST"
}

# All tool abbreviations (upper-case), in manifest order.
catalog_all_abbrs() {
  catalog_rows | awk -F'\t' '{print $1}'
}

# Echo the raw tab-separated row for a selector (matches abbr OR cli, case-insensitive).
# Returns non-zero if not found.
catalog_row() {
  local sel="$1" lc
  lc="$(printf '%s' "$sel" | tr '[:upper:]' '[:lower:]')"
  catalog_rows | awk -F'\t' -v s="$lc" '
    { a=tolower($1); c=tolower($3) }
    a==s || c==s { print; found=1; exit }
    END { if (!found) exit 1 }
  '
}

# Field accessors given a row string.
row_abbr()   { printf '%s' "$1" | awk -F'\t' '{print $1}'; }
row_repo()   { printf '%s' "$1" | awk -F'\t' '{print $2}'; }
row_cli()    { printf '%s' "$1" | awk -F'\t' '{print $3}'; }
row_method() { printf '%s' "$1" | awk -F'\t' '{print $4}'; }
row_ref()    { printf '%s' "$1" | awk -F'\t' '{print $5}'; }
row_args()   { local a; a="$(printf '%s' "$1" | awk -F'\t' '{print $6}')"; [ "$a" = "-" ] && a=""; printf '%s' "$a"; }

# Resolve a list of selectors to canonical abbrs; empty input means "all".
# Fails loud (non-zero + message on stderr) if any selector is unknown.
catalog_select() {
  if [ "$#" -eq 0 ]; then
    catalog_all_abbrs
    return 0
  fi
  local sel row rc=0
  for sel in "$@"; do
    if row="$(catalog_row "$sel")"; then
      row_abbr "$row"
    else
      printf 'macacfs: unknown tool: %s\n' "$sel" >&2
      rc=1
    fi
  done
  return "$rc"
}

# Count of tools in the catalog.
catalog_count() { catalog_rows | wc -l | tr -d ' '; }
