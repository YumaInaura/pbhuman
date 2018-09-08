#!/usr/bin/env bash -eu

readonly eco_path=${ECO_PATH:-"$HOME/eco"}

mkdir -p "$eco_path"/bin

for lib_file_path in $(find "$eco_path/lib" -type f); do
  bin_file_path=$(echo "$lib_file_path" | perl -pe 's!^.+lib/!!g' | perl -pe 's!/!-!g')
  cp -rv "$lib_file_path" "bin/$bin_file_path"
  chmod +x "bin/$bin_file_path"
done

