#!/bin/bash
#Description: Get phone number from database.
#Wirte by 350 (weilin.jang@gmail.com)
#Version: v1.00

PS3="請選擇模式: "

select option in "模糊比對" "完整比對" "印出資料庫" "寫入資料庫" "Quit"
do
    case $option in
        "模糊比對")
            read -p "[PHONEBOOK] Enter Name: " queryName
            grep -i $queryName data.txt | cut -d "" -f2
            ;;
        "完整比對")
            read -p "[PHONEBOOK] Enter Name: " queryName
            grep -iw $queryName data.txt | cut -d "" -f2
            ;;
        "印出資料庫")
            cat data.txt
            echo ""
            ;;
        "寫入資料庫")
            read -p "fromat: Name Number " newName
            if [[ $newName =~ ^[a-zA-Z]+\ [0-9]{10}$ ]]; then
                echo  "$newName" >> data.txt
                echo "finish!"
            else
                echo "BAD format!"
            fi
            ;;
        "Quit")
            echo "退出"
            break
            ;;
        *)
            echo "錯誤的選項，請重新輸入"
            ;;
    esac
done
exit 0
