#!/bin/bash

# Well, look at what we got here! This one is curious! Welcome to a Bash script! This is the logic that validates whether or not you have completed the task. 
# Feel free to look around, we've got nothing to hide. In fact, you might learn Bash along the way.

# Declare a variable called "file" and set it equal to the file that should exist if the task is complete. 
file=./task0-file.txt

# Determine whether or not the file exists or not, if so..
if [ -f "$file" ]; then

	# Notify the user that the task is complete
	echo -e "\nTask complete!\n"
	
	# Unlock the next room
	chmod +xr ./room1

# Otherwise...
else 
	# Notify the user that the task is incomplete
	echo -e "\nYou have not completed the task yet.\n"

	# Ensure that the next room stays locked
	chmod -xr ./room1

fi

