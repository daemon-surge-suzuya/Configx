{ pkgs, lib, ... }:

let
_ = lib.getExe;
in 

pkgs.writeShellScriptBin "animated-wall" ''
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <path_to_wallpaper>"
    exit 1
fi

wallpaper_path=$1

if [ ! -f "$wallpaper_path" ]; then
    echo "Error: Wallpaper not found at '$wallpaper_path'"
    exit 1
fi

${_ pkgs.xwinwrap} -g 1920x1080 -fs -d -fdt -sp -st -nf -ov -- mpv -wid WID --loop "$wallpaper_path" &
''
