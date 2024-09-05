{ pkgs, lib, ... }:

let 
_ = lib.getExe;
in

pkgs.writeShellScriptBin "pack" ''

#!/bin/sh

usage() {
    >&2 printf 'Usage: %s [-r remove] [-xz] [-lz4] <dir>\n' "''${0##*/}"
    exit 1
}

while [ "$1" ] ; do
    case ''${1#-} in
        lz4)
            ALGO=lz4
            shift
            ;;
        xz)
            ALGO=xz
            shift
            ;;
        r)
            REMOVE=true
            shift
            ;;
        *)
            break
    esac
done

[ -d "$1" ] || usage

# exit if root
[ "$1" = / ] && exit 1

: "''${ALGO:=xz}"
out="''${1%/}".tar.$ALGO

if [ -f "$out" ] ; then
    printf "file '%s' exists, overwrite? (y/n): " "$out"
    read -r ans
    [ "$ans" = y ] || exit 1
fi

case $ALGO in
    xz)  tar -cvf - "$1" | ${_ pkgs.xz} -qcT 0 > "$out" ;;
    lz4) tar -cvf - "$1" | ${_ pkgs.lz4} -q -6 > "$out"
esac

[ $? -eq 0 ] || exit 1

if [ "$REMOVE" ] ; then
    rm -r "$1"
fi

''
