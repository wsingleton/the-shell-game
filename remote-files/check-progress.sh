#!/bin/bash

if [[ $1 == "" ]]; then 
	echo -e "\nYou must provide a username to check the progress of!\n"
	exit 1
fi

username=$1

echo $username

sudo -i -u $username bash << EOF

export progress=0

echo -e "\nCurrently logged in as: $username\n"
sleep 1

echo -e "\nChecking TSG progress...\n"
cd ~/the-shell-game/room0/room1 1>/dev/null 2>/dev/null && progress=\$((\$progress + 10))
cd room2 1>/dev/null 2>/dev/null && progress=\$((\$progress + 10))
cd room3 1>/dev/null 2>/dev/null && progress=\$((\$progress + 10))
cd room4 1>/dev/null 2>/dev/null && progress=\$((\$progress + 10))
cd room5 1>/dev/null 2>/dev/null && progress=\$((\$progress + 10))
cd room6 1>/dev/null 2>/dev/null && progress=\$((\$progress + 10))
cd room7 1>/dev/null 2>/dev/null && progress=\$((\$progress + 10))
cd room8 1>/dev/null 2>/dev/null && progress=\$((\$progress + 10))
cd room9 1>/dev/null 2>/dev/null && progress=\$((\$progress + 10))
cd room10 1>/dev/null 2>/dev/null && progress=\$((\$progress + 10))

echo -e "\n$username's progress: \$progress%\n"

EOF
