#!/bin/bash
#Ray
#Description:You can change the password here. When you want to check password, you only can test three times.
cpassword="123"
attemps="0"
max="3"

until [ "$attemps" -eq "$max" ]
do
    read -p "enter pswd: " inputpswd
    if [ $inputpswd == $cpassword ]
    then
        echo "pswd correct"
        exit 0
    else
        echo "Incorrect password. Try again."
        attemps=$[attemps+1]
    fi
done
echo "Access denied."
exit 1

