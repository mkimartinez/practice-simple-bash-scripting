#!/bin/bash
#list all files in a directory in a menu for user to select
select file in *
do
	stat "$file"
	break
done
