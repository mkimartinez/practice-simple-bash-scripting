#!/bin/bash
for file in * 
do 
	echo "$(stat -c"%a %A" "$file") $(md5sum "$file")"
done

