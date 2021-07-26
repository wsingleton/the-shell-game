#!/bin/bash

room5=./room5

if [ -d "./.room5" ]; then
	room5=./.room5
fi	

for i in 1 2 3 4 5
do
	if [ -d "./virus$i" -o -f "$virusRoot" ]; then
		echo -e "\nYou have not completed the task.\n"
			mv $room5 ./room5
	       	chmod -xr $room5
		exit 1       
	fi	
done

echo -e "\nTask complete!\n"
chmod +xr $room5

