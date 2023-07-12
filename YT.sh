#! /bin/bash

while true
do

	Distro=$(cat /etc/*release | grep NAME | head -n1 | cut -d '=' -f2 | tr -d \")

	if [[ $Distro == "Arch Linux" ]]; then

		if pacman -Qs "yt-dlp" > /dev/null ; then

			printf "%s\nyt-dlp is installed..."
			sleep 1

			printf "%s\nproceeding..."
			sleep 2

			printf '\033\143'
			printf "%s\nChoose:\n 1:SFX\n 2:Music\n\n"

			read -p "Choice: " usrInput_Choice

			case $usrInput_Choice in
				1)
					read -p "Link: " usrInput_Link
					yt-dlp -P /home/*/Music/SFX -x $usrInput_Link --audio-format mp3

					read -p "Continue? (y/N): " usrInput_Choice
					case $usrInput_Choice in
						y|Y)
							printf "%s\nAight..."
							sleep 1
							;;
						n|N)
							break
							;;
						*)
							break
							;;
					esac
				;;
				2)
					read -p "Link: " usrInput_Link
					yt-dlp -P /home/*/Music/Library -x $usrInput_Link --audio-format mp3

					read -p "Continue? (y/N): " usrInput_Choice
					case $usrInput_Choice in
						y|Y)
							printf "%s\nAight..."
							sleep 1
							;;
						n|N)
							break
							;;
						*)
							break
							;;
					esac
					;;
				*)
					printf "%s\n Bro... Input something...\n"
					break
					;;
			esac

		else

			printf "%s\nyt-dlp is not installed... \nexiting...\n\n"
			sleep 2

			printf '\033\143'
			break

		fi

	fi

done
