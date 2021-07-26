#!/bin/bash

unpackedDir=./tmp/jdk8u292-b10

if [ -d "$unpackedDir" ]; then
	echo -e "\nTask complete!\n"
	chmod +xr room7
else
	echo -e "\nYou have not completed the task.\n"
	chmod -xr room7
fi
