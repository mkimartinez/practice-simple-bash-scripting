#!/bin/bash
FILE="/home/mki/Dgesktop/scripts"
if test -e "$FILE";
then 
	echo "$FILE exists"
fi
if test -x "$FILE";
then
	echo "You have permision to execute file"
else
	echo "You dont have permision"

fi

