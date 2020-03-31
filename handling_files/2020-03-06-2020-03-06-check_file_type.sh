read -p "Enter file name or directory name " FILENAME
if test -f $FILENAME; then
	echo "Its a normal file"
fi
if test -d $FILENAME; then
	echo "its a directory"
	ls -l $FILENAME
fi
