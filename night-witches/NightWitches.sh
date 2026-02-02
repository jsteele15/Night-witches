#!/bin/sh
printf '\033c\033]0;%s\a' Night witches
base_path="$(dirname "$(realpath "$0")")"
"$base_path/NightWitches.x86_64" "$@"
