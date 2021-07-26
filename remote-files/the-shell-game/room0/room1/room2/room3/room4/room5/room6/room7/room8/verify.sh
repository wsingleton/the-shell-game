#!/bin/bash

providedKey=$1
actualKey=$(curl -s https://innov8dev-resources.s3.amazonaws.com/tome-key.txt | head -n 1)
sleep 1

if [[ "$providedKey" == "$actualKey" ]]; then 
	echo -e "\nTask complete!\n"
	chmod +xr room9
	chmod +w ~/.bashrc
else
	echo -e "\nYou have not completed the task.\n"
	chmod -xr room9
	chmod -w ~/.bashrc
fi

