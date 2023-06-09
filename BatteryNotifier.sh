#! /bin/bash

# || THE CODE BELOW KILLS DUPLICATE INSTANCES || #

for pid in $(pgrep -f $0);
do
	if [ $pid != $$ ]; 
	then
		kill $pid
	fi
done

# || THE CODE ABOVE KILLS DUPLICATE INSTANCES || #




while true
do
	# ~ YOU CAN EDIT THE CODE BELOW ~ #

	# NOTE: you can check your device name using "upower -d" #
	DEVICE_NAME='battery_BAT1'
	
	# ~ YOU CAN EDIT THE CODE ABOVE ~ #
	
	
	
	
	# || WARNING: DO NOT EDIT THE CODE BELOW || #
	
	LOCATION='/org/freedesktop/UPower/devices'
	DEVICE_LOCATION="$LOCATION/$DEVICE_NAME"
	
	CMD=$(upower -i "$DEVICE_LOCATION")
	
	PCT=$(awk '{gsub("%","")} /percentage/ {printf "%s\n", $NF}' <<< "$CMD")
	STATE=$(awk '/state/ {print $NF}' <<< "$CMD" | grep -c "discharging")
	
	# || WARNING: DO NOT EDIT THE CODE ABOVE || #




	if [ "$STATE" -eq 1 ]; then
		if [ "$PCT" -le 20 ]; then
			notify-send --app-name "PAY ATTENTION!!!" -t 2000 -u normal "Battery Low. Plug the Charger!"
			#play "/home/dux/Music/SFX/Low Battery SFX.mp3"
			play "/usr/share/sounds/Oxygen-Sys-App-Error-Serious.ogg"
		fi
	elif [ "$STATE" -eq 0 ]; then
		if [ "$PCT" -ge 85 ]; then
			notify-send --app-name "PAY ATTENTION!!!" -t 2000 -u normal "Battery Full. Unplug the Charger!"
			play "/usr/share/sounds/Niko-Niko-Nii-SFX.ogg"
		fi
	fi
	
	sleep 10
done
