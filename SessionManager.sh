#! /bin/bash

lines="-l 6"

SessionMenu="i3 Session Manager: "
Options="Close\nLock\nSuspend\nLogout\nReboot\nShutdown"
Confirmation="No\nYes"

Menu() {
    usrInput="$( echo -e $1 | dmenu -i -p "$2" $lines )"
}

Menu "$Options" "$SessionMenu"

case $usrInput in
    "Close")
        exit 0
        ;;

    "Lock")
        Menu "$Confirmation" "Lock Screen?"
        if [[ $usrInput == "Yes" ]]; then
            betterlockscreen -l dimblur &
        fi
        exit 0
        ;;

    "Suspend")
        Menu "$Confirmation" "Sleep?"
        if [[ $usrInput == "Yes" ]]; then
            betterlockscreen -s &
        fi
        exit 0
        ;;

    "Logout")
        Menu "$Confirmation" "Log out of i3?"
        if [[ $usrInput == "Yes" ]]; then
            i3-msg exit &
        fi
        exit 0
        ;;

    "Reboot")
        Menu "$Confirmation" "Reboot?"
        if [[ $usrInput == "Yes" ]]; then
            systemctl reboot &
        fi
        exit 0
        ;;

    "Shutdown")
        Menu "$Confirmation" "Shutdown?"
        if [[ $usrInput == "Yes" ]]; then
            systemctl poweroff &
        fi
        exit 0
        ;;
esac

exit 0
