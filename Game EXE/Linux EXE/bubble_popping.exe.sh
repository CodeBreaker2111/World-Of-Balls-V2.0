#!/bin/sh
echo -ne '\033c\033]0;bubble_popping\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/bubble_popping.exe.x86_64" "$@"
