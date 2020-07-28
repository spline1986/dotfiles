#!/bin/bash

ITEM=$(rofi -dmenu < ~/.i3/menu)

case "$ITEM" in
	caesium)
		cd ~/idec
		urxvt -fn "xft:Iosevka:size=16:bold" -fb "xft:Iosevka:size=16:bold" -title Caesium -name Caesium -e ./caesium.py
	;;
	moria)
		urxvt +uc -fg "#fabd2f" -fn "xft:Iosevka:size=16:bold" -fb "xft:Iosevka:size=16:bold" -title Moria -name Moria -e moria
	;;
	ncmpcpp)
		urxvt -title ncmpcpp -name ncmpcpp -e ncmpcpp
	;;
	nethack)
		urxvt -uc -cr "#a8a8a8" -fg "#c5a001" -fn "xft:xos4 Terminus:size=14:bold" -fb "xft:xos4 Terminus:size=14:bold" -title Nethack -name Nethack -e nethack
	;;
	unnethack)
		urxvt +uc -fg "#c5a001" -fn "xft:xos4 Terminus:size=14:bold" -fb "xft:xos4 Terminus:size=14:bold" -title UnNethack -name UnNethack -e unnethack
	;;
esac
