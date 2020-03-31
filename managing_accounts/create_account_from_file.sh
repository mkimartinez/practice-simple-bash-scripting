#!/bin/bash
# create user account from a text file containing user name and password
while read u1 p1
do

echo "Username:$u1 Password:$p1 created"
adduser $u1
echo "$p1 | passwd --stdin "$u1""
echo Username:$u1 Password:$p1 created
done < userlist.txt
