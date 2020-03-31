#!/bin/bash
echo "Which Operating system do you like"
select os in Ubuntu LinuxMint Windows
do
	case $os in
		"Ubuntu"|"linuxMint")
			echo "You are a genius for using linux";;
		"Windows")
			echo "You should try Linux";;
		*)
			echo "Invalid entry"
			break
			;;
	esac
done

