#!/bin/bash
#function to dispaly number of files in cwd
function file_count()
{
	NUMBER_OF_FILES=$(ls -l | wc -l)
	echo "$NUMBER_OF_FILES"
}

