#!/bin/bash

cat /etc/shadow
if [ "$?" -eq "0" ]
then
	echo "Command was successfull"
	exit 0
else
	echo "Command Failed"
	exit 1

fi
