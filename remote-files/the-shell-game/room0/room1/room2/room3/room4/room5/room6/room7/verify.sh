#!/bin/bash

file=openjdk-8.tar.gz

if [ -f "$file" ]; then
	if ! tar tf $file &> /dev/null; then
		echo -e "\nYou have not completed the task.\n"
		chmod -xr room8
		exit 1;
	fi
	tlf=`tar -tzf $file | head -1 | cut -f1 -d"/"`
	if [ $tlf == "jdk8u292-b10" ]; then
		echo -e "\nTask complete!\n"
		chmod +xr room8
		exit 0
	fi
fi
echo -e "\nYou have not completed the task.\n"
chmod -xr room8
