#!/bin/bash

original=./boulder.data
compare=./bin/.compare.data
file=./bin/boulder.data

if [ ! -f "$original" -a -f "$file" ]; then
	if cmp --silent "$file" "$compare"; then
		echo -e "\nTask complete!\n"
        	chmod +xr ./room4
		exit 0
	fi
fi

echo -e "\nYou have not completed the task.\n"
chmod -xr ./room4

