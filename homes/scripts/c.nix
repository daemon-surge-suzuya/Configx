{ pkgs, lib, ... }:

let 
_ = lib.getExe;
in

pkgs.writeShellScriptBin "c" ''

#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <file1> [<file2> ...]"
    exit 1
fi

for file; do
    if [ -f "$file" ]; then
        if [ -x "$file" ]; then
            chmod -x "$file"
            echo "Execute permission removed from $file"
        else
            chmod +x "$file"
            echo "Execute permission added to $file"
        fi
    else
        >&2 printf 'Error: %s does not exist.\n' "$file"
    fi
done

''
