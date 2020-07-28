#!/bin/bash

while true; do
	unset lines
	for a in $(find ~/docs/pics/wallpapers/ -type f);do
		lines[i++]=$a
	done
	FILE=${lines[$RANDOM % $i]}

	feh --bg-center $FILE

	sleep 1800
done
