#!/bin/bash
FUNADD(){
    if [ $1 -eq "0" ] ;then
        exit 1
    fi
    echo "total is: $1"
    varAvg=$(echo "scale=2; $1 / $2" | bc)
    echo "average=$varAvg"
}
varNum=0
varinp=""
varTime=0
varAvg=0
until [ $varInp == "END" ] 2> /dev/null
do
    read -p "input a number: " varInp
    [ -z $varInp ] 2> /dev/null && echo "please enter some number." && continue
    if [ $varInp == "END" ]
    then
        continue
    fi
    ! [ $varInp -eq $varInp ] 2> /dev/null && echo "please enter number." && continue
    varNum=$[varNum+varInp]
    varTime=$[varTime+1]
    echo "$varTime"
done
    FUNADD $varNum $varTime
exit  0

