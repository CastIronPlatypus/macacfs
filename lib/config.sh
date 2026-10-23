# lib/config.sh — persistent macacfs settings (key=value file).
# Realizes: config-code / fb-lib-config.
#
# File: ${XDG_CONFIG_HOME:-~/.config}/macacfs/config, one KEY=VALUE per line.
# Every known key has an env override (MACACFS_<KEY upper, . and - -> _>).
# Precedence for consumers: command-line flag > env > config file > default.
# Works under bash 3.2 too (no associative arrays) so any script may source it.

config_file() {
  printf '%s/macacfs/config\n' "${XDG_CONFIG_HOME:-$HOME/.config}"
}

# key|default|description
config_registry() {
  cat <<'EOF'
newproj.github|off|create a GitHub repo for every newproj: off, private or public
newproj.ru|off|register every newproj with ru: on or off
newproj.projects_dir||default parent directory for newproj (absolute path; empty = auto)
EOF
}

config_known_keys() { config_registry | cut -d'|' -f1; }

config_default() { config_registry | awk -F'|' -v k="$1" '$1==k{print $2; exit}'; }

config_is_known() { config_known_keys | grep -qxF -- "$1"; }

config_env_name() {
  printf 'MACACFS_%s\n' "$(printf '%s' "$1" | tr '[:lower:].-' '[:upper:]__')"
}

# config_validate KEY VALUE -> 0 ok, 1 with message on stderr
config_validate() {
  local key="$1" val="$2"
  case "$key" in
    newproj.github)
      case "$val" in off|private|public) return 0 ;; esac
      printf 'macacfs config: %s must be off, private or public (got "%s")\n' "$key" "$val" >&2; return 1 ;;
    newproj.ru)
      case "$val" in on|off) return 0 ;; esac
      printf 'macacfs config: %s must be on or off (got "%s")\n' "$key" "$val" >&2; return 1 ;;
    newproj.projects_dir)
      case "$val" in
        "") return 0 ;;
        /*) case "$val" in *[[:cntrl:]]*) ;; *) return 0 ;; esac ;;
      esac
      printf 'macacfs config: %s must be an absolute path\n' "$key" >&2; return 1 ;;
  esac
  printf 'macacfs config: unknown key "%s" (known: %s)\n' "$key" "$(config_known_keys | tr '\n' ' ')" >&2
  return 1
}

# Raw value from the file (empty + rc 1 when unset).
config_get_raw() {
  local file; file="$(config_file)"
  [ -f "$file" ] || return 1
  awk -v k="$1" 'index($0, k "=") == 1 { v = substr($0, length(k) + 2); found = 1 } END { if (found) { print v; exit 0 } exit 1 }' "$file"
}

# Effective value: env > file > default. Prints "value<TAB>source" with -s.
config_effective() {
  local key="$1" show_src="${2:-}" envn val src
  envn="$(config_env_name "$key")"
  if [ -n "${!envn:-}" ]; then
    val="${!envn}"; src="env $envn"
  elif val="$(config_get_raw "$key")"; then
    src="$(config_file)"
  else
    val="$(config_default "$key")"; src="default"
  fi
  if [ "$show_src" = "-s" ]; then printf '%s\t%s\n' "$val" "$src"; else printf '%s\n' "$val"; fi
}

config_set() {
  local key="$1" val="$2" file dir tmp
  config_validate "$key" "$val" || return 1
  file="$(config_file)"; dir="$(dirname "$file")"
  mkdir -p "$dir" || return 1
  tmp="$(mktemp "$dir/.config.XXXXXX")" || return 1
  if [ -f "$file" ]; then
    awk -v k="$key" 'index($0, k "=") != 1' "$file" > "$tmp" || { rm -f "$tmp"; return 1; }
  fi
  printf '%s=%s\n' "$key" "$val" >> "$tmp"
  chmod 600 "$tmp" && mv -f "$tmp" "$file"
}

config_unset() {
  local key="$1" file tmp
  config_is_known "$key" || { printf 'macacfs config: unknown key "%s"\n' "$key" >&2; return 1; }
  file="$(config_file)"
  [ -f "$file" ] || return 0
  tmp="$(mktemp "$(dirname "$file")/.config.XXXXXX")" || return 1
  awk -v k="$key" 'index($0, k "=") != 1' "$file" > "$tmp" && chmod 600 "$tmp" && mv -f "$tmp" "$file"
}

config_list() {
  local key line val src
  printf 'config file: %s\n' "$(config_file)"
  while IFS='|' read -r key _ desc; do
    line="$(config_effective "$key" -s)"
    val="${line%%	*}"; src="${line#*	}"
    printf '  %-22s %-10s (%s)  — %s\n' "$key" "${val:-\"\"}" "$src" "$desc"
  done < <(config_registry)
}

config_usage() {
  cat <<EOF
Usage: macacfs config list
       macacfs config get KEY
       macacfs config set KEY VALUE
       macacfs config unset KEY

Keys:
$(config_registry | awk -F'|' '{printf "  %-22s %s (default: %s)\n", $1, $3, ($2 == "" ? "auto" : $2)}')
EOF
}

config_main() {
  local sub="${1:-list}"; shift || true
  case "$sub" in
    list|ls) config_list ;;
    get)
      [ $# -eq 1 ] || { config_usage >&2; return 2; }
      config_is_known "$1" || { printf 'macacfs config: unknown key "%s"\n' "$1" >&2; return 1; }
      config_effective "$1" ;;
    set)
      [ $# -eq 2 ] || { config_usage >&2; return 2; }
      config_set "$1" "$2" && printf '%s=%s\n' "$1" "$2" ;;
    unset)
      [ $# -eq 1 ] || { config_usage >&2; return 2; }
      config_unset "$1" ;;
    help|-h|--help) config_usage ;;
    *) printf 'macacfs config: unknown subcommand "%s"\n\n' "$sub" >&2; config_usage >&2; return 2 ;;
  esac
}
