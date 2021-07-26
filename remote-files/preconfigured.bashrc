# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
function locked-door() {
	echo -e "\nThe door is locked and will not open.\n"
}

function success() {
	echo -e "\nYou are successful!\n"
}

function failure() {
	case $1 in
		ls)
			echo -e "\nYou are unable to see anything.\n"
			;;
		cd)
			echo -e "\nThe door is locked and will not open.\n"
			;;
		mv)
			echo -e "\nYou find yourself unable to move the item.\n"
			;;
		spell)
			echo -e "\nA strange force prevents your spell from working.\n"
			;;
		cat)
			echo -e "\nYou are unable to make anything of it.\n"
			;;
		sh)
			echo -e "\nYou are unable to run that file here.\n"
			;;
	esac
}

function cd() {
	
	if [ $1 = ~ ]; then
		echo -e "\nYou begin casting the spell: Homeward Bound\n"
		sleep 2
		builtin cd "$1" 2>/dev/null && echo -e "You find yourself back at home.\n" || echo -e "A strange force prevents you from leaving.\n"
	elif [ $1 = .. ]; then
		echo -e "You attempt to go back through the door you just came through."
		sleep 0.5
		builtin cd "$1" 2>/dev/null && echo -e "\nYou are back in the previous room.\n" || locked-door
	else
		echo -e "\nYou approach the door labeled: $1\n"
		sleep 0.5
		builtin cd "$1" 2>/dev/null && echo -e "\nYou enter the room.\n" || locked-door
	fi

}

function ls() {
	
	if [[ $2 == ".." ]]; then
		echo -e "\nYou attempt to look back to the previous room.\n"
	elif [[ $2 == ~ ]]; then
		echo -e "\nYou attempt to recall your starting point and its details.\n"
	fi

	if /usr/bin/ls $@ 1>/dev/null 2>/dev/null; then
		
		if [[ "$@" == *"-A"* || "$@" == *"-a"* ]]; then
			echo -e "\nYou try to observe the room and its contents very closely in an attempt to uncover things that are often overlooked.\n"
		elif [[ "$@" == *"-l"* ]]; then
			echo -e "\nYou try to study the room and its contents, looking to infer additional details about them.\n"
		else
			echo -e "\nYou try to quickly glance around the room.\n"
		fi

		sleep 0.5
		/usr/bin/ls $@ --color=auto 2>/dev/null

	else 
		echo -e "\nYou are unable to see anything.\n"
	fi
}

function cat() {
	echo -e "\nYou attempt to read the contents of the item...\n"
	sleep 1
	/usr/bin/cat $@ 2>/dev/null || failure cat
}

function chmod() {
	echo -e "\nYou attempt to pick the lock but fail.\n"
}

function cp() {
	echo -e "\nYou begin casting the spell: Duplication\n"
	sleep 2
	/usr/bin/cp "$@"  2>/dev/null && success || failure spell
}

function mv() {
	echo -e "\nYou attempt to move an object to a new location.\n"
	sleep 2
	/usr/bin/mv "$@" 2>/dev/null && success || failure mv
}

function rm() {
	echo -e "\nYou attempt to destroy an object.\n"
	sleep 2
	/usr/bin/rm $@ 2>/dev/null && success || failure rm
}

function dir() {
	echo -e "\nWindows user, eh? If you are looking to list the contents of some directory, try the command: ls\n"
}

function touch() {
	echo -e "\nYou begin casting the spell: Create Item\n"
	
	if [[ $1 == *"verify.sh"*]; then
		failure spell
	fi
	
	/usr/bin/touch $@ 2>/dev/null && success || failure spell
}

function curl() {
	echo -e "\nYou begin casting the spell: Telecommunipathy\n"
	/usr/bin/curl $@ 2>/dev/null || failure spell
}

function sh() {
	if [[ "$@" == *"verify.sh"* || "$@" == *"run-me.sh"* || "$@" == *"task5.sh"* || "$@" == *"reset.sh"* ]]; then
		/usr/bin/sh $@
	else
		failure sh
	fi
}

function sudo() {
	echo -e "\nYou attempt to invoke the power of Sudo...\n"
	sleep 2
	echo -e "\n...but are deemed unworthy.\n"
	sh ~/.tsg/reset.sh
}

function mkfs() {
	echo -e "\nYou should not invoke powers you do not understand.\n"
}
