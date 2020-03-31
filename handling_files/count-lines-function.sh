#!/bin/bash
#use function to count lines, path given as an argument
function count_lines()
{
	for F in $(ls $path)
	do
		if [[ -f $F ]] 
		then
			echo $F:$(cat $F | wc -l)
		fi
	done
}
count_lines
