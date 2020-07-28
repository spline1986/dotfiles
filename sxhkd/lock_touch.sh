#!/bin/bash

ID=$(xinput list | grep ELAN | awk '{print $6}' | sed 's/id=//')

if [ -f /var/lock/locktouch ]; then
	rm /var/lock/locktouch
    xinput set-prop $ID "Device Enabled" 1
else
	touch /var/lock/locktouch
	xinput set-prop $ID "Device Enabled" 0
fi
