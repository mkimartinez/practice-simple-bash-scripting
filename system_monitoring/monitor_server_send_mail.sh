# vi /opt/scripts/cpu-memory-swap-1.sh

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
echo "-------------------------------------------" >> /tmp/cpu-mem-swap.txt
echo "Server_Name   CPU(%)   Memory(%)   Swap(%)" >> /tmp/cpu-mem-swap.txt
echo "-------------------------------------------" >> /tmp/cpu-mem-swap.txt
for server in `more /opt/scripts/server-list.txt`
do
scpu=$(ssh $server cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1)
smem=$(ssh $server free | awk '/Mem/{printf("%.2f%"), $3/$2*100}')
sswap=$(ssh $server free | awk '/Swap/{printf("%.2f%"), $3/$2*100}')
echo "$server   $scpu   $smem   $sswap" >> /tmp/cpu-mem-swap.txt
done | column -t
echo "-------------------------------------------" >> /tmp/cpu-mem-swap.txt
echo "CPU and Memory Report for `date +"%B %Y"`" | mailx -s "CPU and Memory Report on `date`" -a /tmp/cpu-mem-swap.txt daygeek@gmail.com
rm /tmp/cpu-mem-swap.txt
