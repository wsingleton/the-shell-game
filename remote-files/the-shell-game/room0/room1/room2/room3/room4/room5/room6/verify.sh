#!/bin/bash

unpackedDir=./tmp/unpacked

if [ -d "$unpackedDir" ]; then
	echo -e "\nTask complete!\n"
	chmod +xr room7
else
	echo -e "\nYou have not completed the task.\n"
	chmod -xr room7
fi
