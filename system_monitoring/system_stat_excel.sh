# vi /opt/scripts/cpu-memory-swap-2.sh

#!/bin/bash
if which mailx > /dev/null
then
echo "mailx package is exist"
elif (( $(cat /etc/*-release | grep "Red Hat" | wc -l) > 0 ))
then
yum install mailx -y > /dev/null 
else
apt install mailutils -y > /dev/null
fi
echo "Server_Name, CPU, Memory, Swap" > /tmp/cpu-mem-swap.csv
#for server in `more /opt/scripts/server-list.txt`
#do
scpu=$(cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1)
smem=$(free | awk '/Mem/{printf("%.2f%"), $3/$2*100}')
sswap=$(free | awk '/Swap/{printf("%.2f%"), $3/$2*100}')
echo "$server, $scpu, $smem, $sswap" >> /tmp/cpu-mem-swap.csv
#done
echo "CPU and Memory Report for `date +"%B %Y"`" | mailx -s "CPU and Memory Report on `date`" -a /tmp/cpu-mem-swap.csv  daygeek@gmail.com
rm /tmp/cpu-mem-swap.csv
