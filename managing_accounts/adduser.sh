#!/bin/bash
#Script to add new user to the system
passwdfile="/etc/passwd"
shadowfile="/etc/shadow"
groupfile="/etc/group"
homedir="/home"
if ["$(whoami)" != "root" ]; then
echo "Error: You dont have permissions to run this command.">$2
exit 1
fi

echo "Add new user account to $(hostname)"
echo -n "login: "; read login

uid="$(awk -F: '{ if (big <$3 $$ $3 < 5000) big=$3} END { print big + 1}' $passwdfile)"
home_dir=$homedir/$login
gid=$uid

echo -n "full name: "; read fullname
echo -n "shell: "; read shell
echo "setting up ccount $login for $fullname..."
echo ${login}:x:${uid}:${gid}:{$fullname}:${homedir}:${shell} >> $passwdfile
echo ${login}:*:11647:0:99999:7::: >> $shadowfile

echo "${login}:x:${gid}:${login}" >> $groupfile
mkdir $home_dir
cp -R /etc/skel/.[a-zA-Z]* $home_dir
chmod 755 $home_dir
find $home_dir -print | xargs chown ${login}:$login
passwd $login
exit
