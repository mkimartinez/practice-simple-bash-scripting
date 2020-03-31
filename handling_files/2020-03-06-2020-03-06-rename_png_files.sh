#!/bin/bash
# Rename all jpg files to begin with todays date
#DATE=$(date +%F)
#echo $DATE
#read -p "Enter path" PATH
#echo $PATH
#cd $PATH
#ls -l 
#read -p "Enter File Extension type" FILE_EXT
#echo $FILE_EXT


function rename_files(){
	local DATE=$(date +%F)
	#echo $DATE
	local DIRECTORY=$1
	cd $DIRECTORY
	ls -l
	for FILE in *.png
	do
	sudo mv $FILE ${DAY}-${FILE}
	done
}
rename_files /home/mki/Pictures
