#!/bin/bash
clear
echo "Checking your network settings"
sleep 5
ip addr >>status.txt
echo "finished saving"
#cat status.txt
cat status.txt |grep inet 
