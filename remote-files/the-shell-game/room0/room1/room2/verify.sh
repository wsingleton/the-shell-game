#!/bin/bash

original=./.secret-compartment/dolly.sheep
clone=./dolly.sheep

if [ -f "$clone" ]; then
	if cmp --silent "$original" "$clone"; then 
		echo -e "\nTask complete!\n"
		chmod +xr ./room3
	else
		echo -e "\nYou have not completed the task.\n"
		chmod -xr ./room3
	fi
else 
	echo -e "\nYou have not completed the task.\n"
	chmod -xr ./room3
fi

