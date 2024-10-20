#!/bin/bash
#Description: Look for files in the specified directory and list the directories.
#Write by Ray
#Version: v1.01 fix find "type“
#v1.00

echo "====  FILE  FINDER  ===="
read -p "Where do you want to start (ex: / ): " varPath
if test -d $varPath
then
    echo  "Check...exist!"
else
    echo  "The  path:$varPath  does  not  exist."
    exit  1
fi

read -p "Please enter a file-name to search: " varFilename

findit=`find $varPath -type f -name $varFilename`

echo "==  SEARCH  COMPLETE  =="
dirname $findit

exit 0
