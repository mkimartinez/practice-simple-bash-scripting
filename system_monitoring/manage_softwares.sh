#!/bin/bash
clear
echo -e "\n$(date "+%d-%m-%Y ---%T") --- Starting work \n"
apt-get update
apt-get -y upgrade
aapt-get -y autoremove
apt-get autoclean 

echo -e "\n$(date "+%T") \t script Terminated"
