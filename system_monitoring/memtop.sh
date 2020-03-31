#!/bin/bash
echo "==============================================="
echo "Function to display application with higher memory usage"
echo "==============================================="
function memtop ()
{
{
echo "_PID_ _Name_ _Mem_"
for i in /proc/[0-9]*
do
echo -e "${i##*/}\t$(<$i/comm)\t$(pmap -d "${i##*/}" |\
tail -1 | {
read a b c mem d
echo $mem
}
)"
done |\
sort -nr -k3 |\
head -$((${LINES:-23} - 3))
} |\
column -t
}
memtop
