#!/bin/bash

wmctrl -a $(./.i3/windows.py | rofi -dmenu -p Window | sed 's/^.* //')
