#!/bin/bash
# command to fully update the system and clean orphaned packages and apt cache
#Set bashto quit script and exit on errors
set -e
#Function update
function update(){
	echo "Starting full system update ....."
	apt-get update
	apt-get dist-upgrade -yy

}
# Clean Function
function clean(){
	echo "Cleaning Up the system ....."
	apt-get autoremove -yy
	apt-get autoclean
}
# function leave
function leave(){
	echo "-----------------------------"
	echo "----Update Complete----------"
	echo "-----------------------------"
	exit
}

# Execution
#update and clean
if ["$1" == "--clean"]; then
	update
	clean
	leave
fi
update
clear
clean
clear
leave

