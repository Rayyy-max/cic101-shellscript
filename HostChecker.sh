#!/bin/bash
#Description: Check lan host exists.
#Write by 350 (weilin.jang@gmail.com)
#Version: v1.00

echo "==== LAN HOST CHECKER ===="

#輸入網段，並檢查
read -p "Please enter the network segment. (e.g., 192.168.0) " varNetSeg
if [[ "$varNetSeg" =~ ^([0-9]{1,3}\.){2}[0-9]{1,3}$ ]]; then
    F1=$(echo "$varNetSeg" | cut -d '.' -f1)
    F2=$(echo "$varNetSeg" | cut -d '.' -f2)
    F3=$(echo "$varNetSeg" | cut -d '.' -f3)
    if [[ "$F1" -le 255 && "$F2" -le 255 && "$F3" -le 255 ]]; then
        :
    else
        echo "Invalid network segment. Please enter a valid network segment. (>255)"
        exit 1
    fi
else
    echo "Invalid network segment. Please enter a valid network segment. (not xxx.xxx.xxx)"
    exit 1
fi

#輸入起始IP、結束IP，並檢查
read -p "Please enter the starting IP. (e.g., 1) " varStarIP
read -p "Please enter the ending IP. (e.g., 254) " varEndIP
if ! [[ "$varStarIP" =~ ^[0-9]+$ && "$varEndIP" =~ ^[0-9]+$ && "$varStarIP" -le "$varEndIP" && "$varStarIP" -gt "0" && "$varEndIP" -lt "255" ]]; then
    echo "Enter the wrong start IP or end IP. "
    exit 1
fi

for (( i=$varStarIP; i<=$varEndIP; i++ ))
do
    ip="$varNetSeg.$i"
    echo -n "pinging $ip... "
    ping -c 1 -i 0.2 -W 1 $ip &> /dev/null
    if [ $? -eq 0 ]
    then
        echo "ONLINE."
    else
        echo "OFFLINE."
    fi
done

echo "======== SCAN END ========"

exit 0
