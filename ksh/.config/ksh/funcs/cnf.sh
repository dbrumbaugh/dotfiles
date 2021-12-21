function cnf  {
  cmd=$1
  FUNCNEST=10
  typeset -a pkgs

  pkgs=$(pkgfile -bv -- "$cmd" 2>/dev/null)

  if (( ${#pkgs[*]} )); then
    printf '%s may be found in the following packages:\n' "$cmd"
    printf '  %s\n' "${pkgs[@]}"
  else
    printf "ksh: %s: command not found\n" "$cmd"
  fi >&2

  return 127
}