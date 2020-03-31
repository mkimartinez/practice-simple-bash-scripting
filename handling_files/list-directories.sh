#!/bin/bash
#bash script to list all directories in a path
echo -p "Enter path"
read PATH 
#list=($(ls))
ls $PATH
list=ls $PATH
for file in $list;
do
	if [[ -d $file ]];then
		echo $file
	fi
done
