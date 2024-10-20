#!/bin/bash
#Description:  Watch  an  account  login  and  print  a  warning.
#Wirte  by  35 0 (weilin.jang@gmail.com)
#Version:  v1.00

#SETUP  Watch  account
watchAccount="USER"

until who | grep -w $watchAccount &> /dev/null
do
  sleep  5
done

echo "WARNING : $watchAccount is Login."

exit  0
