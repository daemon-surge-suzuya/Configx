{ pkgs, lib, ...}:

let
_ = lib.getExe;
in

pkgs.writeShellScriptBin "dwmbar" ''

battery() {
	power=$(cat /sys/class/power_supply/BAT0/capacity);
	status=$(cat /sys/class/power_supply/BAT0/status);	icon=""
	if [ "$power" -ge 90 ]; then icon="󰁹";
	elif [ "$power" -lt 90 ] && [ "$power" -ge 80 ]; then icon="󰂂";
	elif [ "$power" -lt 80 ] && [ "$power" -ge 70 ]; then icon="󰂁";
	elif [ "$power" -lt 70 ] && [ "$power" -ge 60 ]; then icon="󰂀";
	elif [ "$power" -lt 60 ] && [ "$power" -ge 50 ]; then icon="󰁿";
	elif [ "$power" -lt 50 ] && [ "$power" -ge 40 ]; then icon="󰁾";
	elif [ "$power" -lt 40 ] && [ "$power" -ge 30 ]; then icon="󰁽";
	elif [ "$power" -lt 30 ] && [ "$power" -ge 20 ]; then icon="󰁼";
	elif [ "$power" -lt 20 ] && [ "$power" -ge 10 ]; then icon="󰁻";
	elif [ "$power" -lt 10 ] && [ "$power" -ge 0 ];  then icon="󰁺";
	fi	
	case "$status" in
		"Charging") power="+$power%";;
		"Discharging") power="$power%" ;;  *) power="?$power%" ;;
	esac;
	echo -e "$icon $power"; }

clock() {
    dt="$(date +"%A   󰃭  %d/%b    %I:%M %p" | sed 's/  / /g')"
    echo -e "$dt"
}

network(){
	ssid="$(${_ pkgs.iw} dev | awk '/ssid/{print $2}')"; icon=" "
	signal=$(nmcli -t -f SIGNAL device wifi | head -n1 )
	case "$ssid" in
		"") ssid="NULL";;  *) ;;
	esac;
	if [ "$signal" = "--" ] || [ -z "$signal" ]; then icon="󰣽"
    	else
		
		if [ "$signal" -ge 80 ]; then icon="󰣺";
		elif [ "$signal" -ge 60 ] && [ "$signal" -lt 80 ]; then icon="󰣸";
		elif [ "$signal" -ge 40 ] && [ "$signal" -lt 60 ]; then icon="󰣶";
		elif [ "$signal" -ge 20 ] && [ "$signal" -lt 40 ]; then icon="󰣴";
	    	else icon="󰣾";
		fi
	fi
	echo -e "$icon $ssid"; }	

keyboard(){
	kb=$(setxkbmap -query | awk '/layout/ {print $2}')
	case "$kb" in
		"gb") kb="Uk";; 	"us") kb="Us";;
		"latam") kb="Es";;	*) kb=$kb;;
	esac;
	echo -e "󰓺 :$kb"; }

while true; do	
	${_ pkgs.xorg.xsetroot} -name "  [ $(keyboard)  $(battery)  $(network) - $(clock) ]  "		
	sleep 5s
done &

''

