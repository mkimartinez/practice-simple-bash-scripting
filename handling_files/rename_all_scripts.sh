#!/bin/bash
# rename all scrpts in the current directory to start with date

function rename_scripts()
{
	local DATE=$(date +%F)
	echo $DATE
	local ALL_FILES=ls
	for FILES in *.sh
	do
		echo $FILES
		mv $FILES ${DATE}-${FILES}
	done
}
#rename_scripts
for files in ls .
do
	echo files
	wc files
done

