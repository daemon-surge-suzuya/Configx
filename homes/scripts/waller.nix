{ pkgs, lib, ... }:

let 
_ = lib.getExe;
in

pkgs.writeShellScriptBin "waller" ''

#!/bin/bash

usage() {
    echo "Usage: $0 -p|--protocol [X11|Wayland] --path <path> [-r|--random] [-a|--animated] [-s|--static]"
    echo "Options:"
    echo "  -p, --protocol     Specify the protocol (X11 or Wayland)"
    echo "  --path             Specify the path to the image or directory"
    echo "  -r, --random       Set a random wallpaper (use with directories)"
    echo "  -a, --animated     Set an animated wallpaper (use with files or directories)"
    echo "  -s, --static       Set a static wallpaper (use with files or directories)"
    exit 1
}

random=false
animated=false
static=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        -p|--protocol)
            protocol=$2
            shift
            ;;
        --path)
            wallpaper_path=$2
            shift
            ;;
        -r|--random)
            random=true
            ;;
        -a|--animated)
            animated=true
            static=false
            ;;
        -s|--static)
            static=true
            animated=false
            ;;
        *)
            echo "Invalid option: $1"
            usage
            ;;
    esac
    shift
done

if [ -z "$protocol" ]; then
    echo "Please specify the protocol using -p or --protocol flag (X11 or Wayland)"
    usage
fi

if [ -z "$wallpaper_path" ]; then
    echo "Please specify the path to the image or directory using --path flag"
    usage
fi

set_wallpaper() {
    if [ -d "$1" ]; then
        if [ "$random" = true ]; then
            if [ "$animated" = true ]; then
                if ! ls "$1"/*.mp4 "$1"/*.gif > /dev/null 2>&1; then
                    echo "Error: No animated images found in the specified directory"
                    exit 1
                fi
            else
                if ! ls "$1"/*.png "$1"/*.jpg "$1"/*.jpeg > /dev/null 2>&1; then
                    echo "Error: No static images found in the specified directory"
                    exit 1
                fi
            fi

            wallpapers=("$1"/*)
            if [ ''${#wallpapers[@]} -eq 0 ]; then
                echo "Error: No files found in the specified directory"
                exit 1
            fi
            random_wallpaper=''${wallpapers[RANDOM % ''${#wallpapers[@]}]}
            ${_ pkgs.swww} img "$random_wallpaper" --transition-fps 30 --transition-type center
        elif [ "$animated" = true ]; then
            if ! ls "$1"/*.mp4 "$1"/*.gif > /dev/null 2>&1; then
                echo "Error: No animated images found in the specified directory"
                exit 1
            fi
            ${_ pkgs.swww} img "$1" --transition-fps 30 --transition-type center
        else
            if ! ls "$1"/*.png "$1"/*.jpg "$1"/*.jpeg > /dev/null 2>&1; then
                echo "Error: No static images found in the specified directory"
                exit 1
            fi
            ${_ pkgs.swww} img "$1" --transition-fps 30 --transition-type center
        fi
    else
        ${_ pkgs.swww} img "$1" --transition-fps 30 --transition-type center
    fi
}

if [ "$protocol" == "X11" ]; then
    if [ "$animated" = true ]; then
        if ! ls "$wallpaper_path"/*.mp4 "$wallpaper_path"/*.gif > /dev/null 2>&1; then
            echo "Error: No animated images found in the specified directory"
            exit 1
        fi
        ${_ pkgs.xwinwrap} -g 1920x1080 -fs -d -fdt -sp -st -nf -ov -- mpv -wid WID --loop "$wallpaper_path" &
    elif [ "$static" = true ]; then
        if ! ls "$wallpaper_path"/*.png "$wallpaper_path"/*.jpg "$wallpaper_path"/*.jpeg > /dev/null 2>&1; then
            echo "Error: No static images found in the specified directory"
            exit 1
        fi
        ${_ pkgs.feh} --bg-fill "$wallpaper_path"
    else
        set_wallpaper "$wallpaper_path"
    fi
elif [ "$protocol" == "Wayland" ]; then
    if [ "$random" = true ]; then
        set_wallpaper "$wallpaper_path"
    elif [ "$animated" = true ]; then
        echo "Error: Please use -r flag to set a random wallpaper for directories"
        exit 1
    else
        set_wallpaper "$wallpaper_path"
    fi
else
    echo "Invalid protocol. Please specify either X11 or Wayland"
    usage
fi

echo "Wallpaper set successfully!"

''
