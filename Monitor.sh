# !/bin/bash

lines="-l 6"

Menu="Monitor Config: "
Options="Close\nSwitch Main eDP\nSwitch Main HDMI\n2nd Monitor OFF\n2nd Monitor ON"

Menu() {
    usrInput="$( echo -e $1 | dmenu -i -p "$2" $lines )"
}

Menu "$Options" "$Menu"

case $usrInput in
    "Close")
        exit 0
        ;;

    "Switch Main eDP")
        exec xrandr --output eDP-1 --primary &
        exit 0
        ;;

    "Switch Main HDMI")
        exec xrandr --output HDMI-1 --primary &
        exit 0
        ;;

    "2nd Monitor OFF")
        exec xrandr --output HDMI-1 --off &
        exec ~/.config/polybar/launch.sh &
        exit 0
        ;;

	"2nd Monitor ON")
		xrandr --output HDMI-1 --mode 1366x768 --left-of eDP-1 &
		exec ~/.config/polybar/launch.sh &
		exit 0
esac
