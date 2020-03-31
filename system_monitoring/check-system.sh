#!/bin/bash
# check system
echo "Memory:"
FREE_PATH=which free
$FREE_PATH/free -h
echo "Disk Free:"
df -h
echo "Disk Usage:"
du -h
echo "System Uptime:"
uptime
exit
