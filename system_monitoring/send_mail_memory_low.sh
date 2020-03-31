#!/bin/bash
print "#################################################################################"
#script Name    : 
#Description    :Send an alert mail when server memory is running low
#Args           :
#Author         :Mki
#Email		:martinamakobe@gmail.com
print "#################################################################################"
## Declare mail variables 
subject="Server memory status alert"
from="18721808260@163.com"
to="mail"

# get total free memory size in MBs
free=$(free -mt |grep Total |awk '{print $4}')

#Check if memory is less or equal to 100

if [["$free" -le 100]]; then
	#Get top processes
	ps -eo pid,ppid,cmd, %mem,%cpu --sort=-%mem | head >/tmp/top_processes_consuming_memory.txt
	file=/tmp/top_processes_consuming_memory.txt

	#send mail
	echo -e "warning, server memory is running low!\n\nFree memory:$free MB"|mail -a "$file" -s "$subject" -r "$from" -c "$to"
fi
exit 0
