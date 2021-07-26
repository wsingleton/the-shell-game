#!/bin/bash

original=~/the-shell-game/room0/room1/room2/room3/bin/boulder.data
file=./rock.data

if [ -f "$file" ]; then
	
	if [ ! -f "$original" ]; then
		echo -e "\nYou were asked to copy the boulder and rename it, not move it. Resetting task...\n"
		chmod -xr room6
		mv $file $original
		exit 1
	fi

	echo -e "\nTask complete!\n"
	sleep 2
	chmod +xr ..
	chmod +xr room6
	echo -e "\nYou hear both doors unlock.\n"
else
	echo -e "\nYou have not completed the task.\n"
	chmod -xr ..
	chmod -xr room6
fi
