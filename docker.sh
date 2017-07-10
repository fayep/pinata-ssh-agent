#!/bin/bash
# Hopefully this won't be needed soon, but it fixes up paths in WSL
# Only necessary on Windows.
cmd=()
stripmount=0
for arg in "$@"; do
  if [ "$stripmount" -eq 1 ]; then
    new="${arg//\/mnt/}"
    if [ "$new" = "$arg" ]; then
      arg="/$arg"
    else
      arg="$new"
    fi
    stripmount=0
  fi
  case "$arg" in
    -v|-w)
        stripmount=1
        ;;
  esac
  cmd+=("$arg")
done
exec /usr/local/bin/realdocker "${cmd[@]}"
