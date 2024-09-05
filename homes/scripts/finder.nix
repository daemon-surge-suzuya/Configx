{ pkgs, lib, ... }:

let 
_ = lib.getExe;
in

pkgs.writeShellScriptBin "f" ''

selected_file=$(find . -type f ! -path '*/.*' | ${_ pkgs.fzf})

if [ -z "$selected_file" ]; then
    echo "No file selected. Exiting."
    exit 1
fi

file_type=$(${_ pkgs.file} -b --mime-type "$selected_file")

case "$file_type" in
    application/pdf)
        ${_ pkgs.zathura} "$selected_file" & 
        ;;
    image/*)
        ${_ pkgs.sxiv} "$selected_file" &
        ;;
    video/*)
        ${_ pkgs.mpv} "$selected_file" & 
        ;;
    text/*)
        ${_ pkgs.neovim} "$selected_file"
        ;;
    *)
        ${_ pkgs.xdg-utils} "$selected_file" & disown
        ;;
esac

''
