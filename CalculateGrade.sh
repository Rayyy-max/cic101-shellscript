#!/bin/bash
#Ray
#Description: Enter the grade, and it will calculate automatically.
FUNADD(){
    if [ $1 -eq "0" ] ;then
        exit 1
    fi
    total1=$(echo "scale=2 ; $1  / ($1 + $2) * 100" | bc)
    total2=$(echo "scale=2 ; $2  / ($1 + $2) * 100" | bc)

    total1=$(echo "$total1" | cut -d '.' -f1)
    total2=$(echo "$total2" | cut -d '.' -f1)
    echo "Passing average: $total1 %"
    echo "Failing average: $total2 %"
#印這個迴圈，範為從0到(最後-1)
    echo "${grade[@]:0:$((${#grade[@]}-1))}"
}

grade[0]=0
passgrade=60
Pcount=0
Fcount=0

until [ ${grade[$1]} == "END" ] 2> /dev/null
do
  read -p "請輸入學生成績（或輸入 'END' 結束輸入）: " grade[i]
  [ -z $grade ] 2> /dev/null && echo "please enter some number." && continue
  if [ "${grade[$i]}" == "END" ]
  then
     break
  fi
  ! [ $grade -eq $grade ] 2> /dev/null && echo "please enter number." && continue

  until [ ${grade[$i]} -lt $passgrade ]
  do
   Pcount=$[Pcount+1]
   break
  done
  while [ ${grade[$i]} -lt $passgrade ]
  do
   Fcount=$[Fcount+1]
   break
  done
  let i=$i+1
done
FUNADD $Pcount $Fcount
exit 0
