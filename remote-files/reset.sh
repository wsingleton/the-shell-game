#!/bin/bash

trap 'catch' ERR

catch() {
	echo -e "\n\033[0;31mSomething went wrong.\033[0mn"
}

echo -e "\nResetting game...\n"
chmod +xr -R ~/the-shell-game/
rm -Rf ~/the-shell-game/
tar -xzf ~/.tsg/the-shell-game.tar.gz -C ~
echo -e "\nReset complete\n"

