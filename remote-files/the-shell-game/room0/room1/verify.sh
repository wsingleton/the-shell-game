#!/bin/bash

dir=./closet
file=./closet/book.txt

if [[ -d "$dir" && -f "$file" ]]; then
	echo -e "\nTask complete!\n"
	chmod +xr ./room2
else 
	echo -e "\nYou have not completed the task\n"
	chmod -xr ./room2
fi

