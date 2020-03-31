#!/bin/bash
#simple script for counting lines in a file
function count_lines()
{
	if [[ -f $F ]]
	then
		echo $F:$(cat|wc -l)
	fi
}
count_lines
