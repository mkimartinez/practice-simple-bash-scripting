#!/bin/bash
#This script is for parsing a csv file
OLDIFS=$IFS
IFS=","

while read user job uid location
do
	echo -e "\e[1;33m$user \
	========================\e[0m\n\
	Role : \t $job\n\
	ID : \t $uid\n\
	SITE : \t $location\n"	
done <$1
IFS=$OLDIFS
