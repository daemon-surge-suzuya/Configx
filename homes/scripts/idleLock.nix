{ pkgs, lib, ... }:

let
_ = lib.getExe;
in 

pkgs.writeShellScriptBin "idleLock" ''

IDLE_THRESHOLD=2
COMMAND="i3lock"

if [ "$#" -gt 0 ]; then
    IDLE_THRESHOLD=$1
    if [ "$#" -gt 1 ]; then
        COMMAND=$2
    fi
fi

IDLE_THRESHOLD=$((IDLE_THRESHOLD * 1000))

while true; do
    IDLE_TIME=$(${_ pkgs.xprintidle})

    MEDIA_STATUS=$(${_ pkgs.playerctl} --all-players status 2>/dev/null)

    if [ "$IDLE_TIME" -gt "$IDLE_THRESHOLD" ]; then
        if [[ "$MEDIA_STATUS" != "Playing" ]]; then
            if ! pgrep -x "$(basename "$COMMAND")" > /dev/null; then
                eval "$COMMAND"
            fi
        fi
    fi

    sleep 1
done


''
