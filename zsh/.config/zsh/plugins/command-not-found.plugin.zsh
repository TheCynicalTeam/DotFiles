command_not_found_handler() {
  local pkgs cmd="$1"

  pkgs=(${(f)"$(pkgfile -b -v -- "$cmd" 2>/dev/null)"})
  if [[ -n "$pkgs" ]]; then
    printf '%s may be found in the following packages:\n' "$cmd"
    yay -F "$cmd"
  else
    printf 'pacman: command not found: %s\n' "$cmd"
  fi 1>&2

  return 127
}

