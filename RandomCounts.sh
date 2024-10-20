#!/bin/bash
# Writer: Ray

for (( i=0; i<30 ; i++ ))
do
    let random_num=$RANDOM*250/32767+250
    if [[ ! "${ansNum[@]}" =~ "$random_num" ]]; then
        ansNum+=("$random_num")
    else
        i=$i-1
        continue
    fi
done

sort_ansNum=($(for i in "${ansNum[@]}"; do echo "$i"; done | sort))

for (( i=0; i<${#sort_ansNum[@]}; i++ ))
do
    echo -n "${sort_ansNum[$i]} "
    if (( i % 3 == 2 )); then
        echo ""
    fi
done

