#!/bin/bash
# display and read menu
clear
echo "
Please Select:
	1. Dispaly System Information
	2.Display disk space
	3. Display home space utilization
	0. quit
"
read -p "Enter selection [0-3] >"
if [[ $REPLY=~^[0-3]$ ]]; then
	if [[ $REPLY == 0 ]];then
		echo " Program terminated"
		exit
	fi
	#echo  "program terminated"
	#exit
	if [[ $REPLY == 1 ]]; then
		echo "hostmane:$HOSTNAME"
		echo "Uptime: uptime"
		exit
	fi	
	if [[ $REPLY == 2 ]]; then
		df -h
		exit

	fi
	if [[ $REPLY == 3 ]]; then
		if [[ $(id -u) -eq 0 ]]; then 
			echo "Home space utilization (all users)"
			du -sh /home/*
		else 
			echo "Home space utilization ($USER)"
			du -sh $HOME
		fi
		exit
	fi
else 
	echo "Invalid entry" >$2
	exit 1
fi

