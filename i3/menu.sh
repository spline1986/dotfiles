#!/bin/bash

#ITEM=$(dmenu -fn "Iosevka:size=10" -nb "#000000" -nf "#888888" -sb "#285577" -sf "#ffffff" < ~/.i3/menu)
ITEM=$(rofi -dmenu < ~/.i3/menu)

case "$ITEM" in
	moria)
		urxvt +uc -fg "#c5a001" -fn "xft:xos4 Terminus:size=14:bold" -fb "xft:xos4 Terminus:size=14:bold" -title Moria -name Moria -e moria
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
