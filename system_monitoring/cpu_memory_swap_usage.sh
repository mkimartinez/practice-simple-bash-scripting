#!/bin/bash
echo "-------------------------------------------"
echo "Server_Name   CPU(%)   Memory(%)   Swap(%)   Uptime(%)"
echo "-------------------------------------------"
#for server in `more /opt/scripts/server-list.txt`
#do
scpu=$(cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1)
smem=$(free | awk '/Mem/{printf("%.2f%"), $3/$2*100}')
sswap=$(free | awk '/Swap/{printf("%.2f%"), $3/$2*100}')
suptime=$(uptime)
echo "$server   $scpu   $smem   $sswap  $suptime"
#done | column -t
echo "-------------------------------------------"
