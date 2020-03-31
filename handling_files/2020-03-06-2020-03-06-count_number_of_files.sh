#!/bin/bash
#function to dispaly number of files in cwd
function file_count()
{
	local directory=$1
	echo $1
	local NUMBER_OF_FILE=$(ls -l $1 | wc -l )
	echo "$NUMBER_OF_FILE"
}
echo "ETC Folder"
file_count "/etc"
echo "VAR Folder"
file_count "/var"
echo "Usr/bin folder"
file_count "/usr/bin"
