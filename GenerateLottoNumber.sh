#!/bin/bash
#Ray

read -p "請輸入您要生成的大樂透號碼組數: " SETS

for (( j=0; j<$SETS ; j++ ))
do
   ansNum=()
   for (( i=0; i<6 ; i++ ))
   do
     let random_num=$RANDOM*48/32767+1
     if [[ ! " ${ansNum[@]} " =~ " $random_num " ]]; then
        ansNum+=("$random_num")
     else
        i=$i-1
        continue
     fi

     echo "${ansNum[$i]}"
   done
   echo -e "\n"
done
exit 0

