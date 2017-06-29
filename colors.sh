#!/bin/sh
#
#  Copyright (C) 2016 Peter Kenji Yamanaka
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License along
#  with this program; if not, write to the Free Software Foundation, Inc.,
#  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#

print_spaces()
{
  for _ in $(seq 1 $((14 + ${#t}))); do
    printf -- " "
  done
}

print_padded_labels()
{
  for num in 40m 41m 42m 43m 44m 45m 46m 47m; do
    printf "%s" "${num}"
    for _ in $(seq 1 $((${#t} + 2))); do
      printf " "
    done
  done
}

print_colors()
{
  echo
  for fgcs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
              '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
              '  36m' '1;36m' '  37m' '1;37m'; do
    fgc=$(printf -- "%s" "${fgcs}" | sed 's/ //g')
    printf " %s \033[%s  %s  " "${fgcs}" "${fgc}" "$t"
    for bgc in 40m 41m 42m 43m 44m 45m 46m 47m; do
      printf " \033[%s\033[%s  %s  \033[0m" \
             "${fgc}" "${bgc}" "$t"
    done
    echo
    unset fgc
  done
}

main()
{
  t=   # The test text
  if [ $# -eq 0 ]; then
    t='gYw'
  else
    t="$1"
  fi

  print_spaces
  print_padded_labels
  print_colors

  unset t
}

main "$@"

