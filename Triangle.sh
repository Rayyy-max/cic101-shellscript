#!/bin/bash
# Descripion:
# W
# V

varNum=""

read -p  "Enter a number: " varNum

varNum2=$(( varNum - 1 ))

for (( i=0; i<$varNum; i++))
do
    for  (( j=o; j<$varNum; j++))
    do
        if [ $[i+j] -lt $varNum ]
        then
            echo -n "* "
        else
            echo -n "  "
        fi
    done
    varNum2=$(( varNum2 - 1 ))
    printf "\n"
done

exit 0
