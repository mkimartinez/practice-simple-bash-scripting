#!/bin/bash
select choice in one two "three four" "Quit"
do
	echo "$REPLY : $choice"
	if [[ $REPLY -eq 4 ]]
	then
		echo "BYEBYE"
		exit
	fi

done
