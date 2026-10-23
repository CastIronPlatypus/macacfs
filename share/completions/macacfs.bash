# bash completion for macacfs. Realizes: fb-share-completions.
# Load with:  source "${MACACFS_HOME:-$HOME/.macacfs}/share/completions/macacfs.bash"

_macacfs_complete() {
  local cur="${COMP_WORDS[COMP_CWORD]}" verb="${COMP_WORDS[1]:-}"
  local manifest="${MACACFS_HOME:-$HOME/.macacfs}/share/manifest.tsv"
  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=($(compgen -W "install update list newproj new config schedule self-update version help" -- "$cur"))
    return
  fi
  case "$verb" in
    install|update)
      COMPREPLY=($(compgen -W "--dry-run $( [ -r "$manifest" ] && grep -vE '^[[:space:]]*(#|$)' "$manifest" | cut -f3)" -- "$cur")) ;;
    newproj|new)
      COMPREPLY=($(compgen -W "-i --interactive --no-br --no-claude --no-agents -h --help --plan --apply --yes --resume --guided --directory --stack --preset --with --beads --agent-mail --agent-mail-token-env --agent-mail-clients --github --github=private --github=public --no-github --gh-private --gh-public --github-owner --ru --no-ru" -- "$cur"))
      [ ${#COMPREPLY[@]} -eq 0 ] && COMPREPLY=($(compgen -d -- "$cur")) ;;
    config)
      case "$COMP_CWORD" in
        2) COMPREPLY=($(compgen -W "list get set unset" -- "$cur")) ;;
        3) COMPREPLY=($(compgen -W "newproj.github newproj.ru newproj.projects_dir" -- "$cur")) ;;
        4) case "${COMP_WORDS[3]}" in
             newproj.github) COMPREPLY=($(compgen -W "off private public" -- "$cur")) ;;
             newproj.ru) COMPREPLY=($(compgen -W "on off" -- "$cur")) ;;
             newproj.projects_dir) COMPREPLY=($(compgen -d -- "$cur")) ;;
           esac ;;
      esac ;;
    schedule) COMPREPLY=($(compgen -W "--install --uninstall --status" -- "$cur")) ;;
  esac
}
complete -F _macacfs_complete macacfs
