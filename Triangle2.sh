#!/bin/bash
# Ray

varNum=""

read -p  "Enter a number: " varNum

varNum2=$(( varNum - 1 ))

for (( i=0; i<$varNum; i++))
do
    for  (( j=o; j<$varNum; j++))
    do
        if [ $j -ge $varNum2 ]
        then
            echo -n "* "
        else
            echo -n "  "
        fi
    done
    varNum2=$[varNum2-1]
    printf "\n"
done

exit 0
