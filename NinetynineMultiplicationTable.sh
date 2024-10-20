#!/bin/bash
# Ray

for (( i=1; i<10; i+=3 ))
do
    for (( j=1; j<10; j++ ))
    do
        varTmpi1=$[i+1]
        varTmpi2=$[i+2]
        echo -e -n "$i * $j = $[i*j]\t"
        echo -e -n "$varTmpi1 * $j = $[varTmpi1*j]\t"
        echo -e -n "$varTmpi2 * $j = $[varTmpi2*j]"
        printf "\n"
    done
    if [ $i -eq "7" ]; then break
    else
        echo -e "\n"
    fi
done

exit 0
