#!/bin/bash
# display menu using elif condition statements
echo "
****************************************
Please select menu item :
	1. Display system information
	2. Display disk space
	3. Display Home space utilization
	0. Quit
*****************************************
	"
read -p "Enter a selection [0-3] :"
if [[ $REPLY =~ ^[0-3]$ ]];then
	if [[ $REPLY == 0 ]]; then
		echo "Process terminated"
		exit 1
	elif [[ $REPLY == 1 ]];then
		echo "Hostname: $HOSTNAME"
		echo "Uptime" :$(uptime)
		exit
	elif [[ $REPLY == 2 ]] ; then
		df -h
	       	exit 1
	elif [[ $REPLY == 3 ]]; then
		if [[$(id -u) -eq 0]] ; then 
			echo "Home space utilization(All users)"
			du -sh /home/*
		else
			echo "Home space utilization ($USER)"
			du -sh $HOME
		fi
	fi
else
	echo "Invalid Entry"
	exit 1
fi


