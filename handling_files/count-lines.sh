#!/bin/bash
#count number of lines in all files in the given directory
echo -p "Enter path "
read PATH1
for F in  $(ls $PATH1)
do
	if [[ -f $F ]]
	then 
		echo $F: $(cat $F | wc -l)
	fi
done
