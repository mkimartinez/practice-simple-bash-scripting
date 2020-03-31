#!/bin/bash
#summarize diskspace and display in a logical fashion
tempfile="/tmp/available.$$"

trap "rm -f $tempfile" EXIT
cat << 'EOF' > $tempfile
	{sum += $4}
END {mb = sum / 1024
     gb = mb /1024
print "%.0f MB (%.2fGB) of available disk space\n", mb , gb}
EOF
df -k | awk -f $tempfile
exit 0

