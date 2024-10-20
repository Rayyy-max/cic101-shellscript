#!/bin/bash
#Ray

varKey[0]=0
declare -A products=(
    [1]="green tea 40"
    [2]="black tea 40"
    [3]="milk tea 55"
)

product_prices=(
    [1]=40
    [2]=40
    [3]=55
)

while [ $varKey -ne "5" ]
do
    clear
    echo "========STARBOOKS========="
    echo "     (1) ${products[1]} \$"
    echo "     (2) ${products[2]} \$"
    echo "     (3) ${products[3]} \$"
    echo "     (4) finish order"
    echo "=========================="
    echo -e "\n\aTime is : `date`\n"
    echo "=========================="

    read -p "Please chose the item: " varKey

    case $varKey in
       1 )
            read -p "請輸入數量: " quantity1
            [ -z $quantity1 ] 2> /dev/null && echo "please enter quantity." && continue
            if [[ ! "$quantity1" =~ ^-?[1-9][0-9]*$ ]]
            then

                echo "無效的數量，請輸入正整數。"
                sleep 2
                continue
            fi
                let total_price1_tmp=${product_prices[1]}*$quantity1
                echo -e "$total_price1_tmp \$"
                let quantity1_total=$quantity1_total+$quantity1
                let total_price1=$total_price1+$total_price1_tmp
                sleep 2
                continue
            ;;
        2 )
            read -p "請輸入數量: " quantity2
            [ -z $quantity2 ] 2> /dev/null && echo "please enter quantity." && continue
            if ! [[ "$quantity2" =~ ^-?[1-9][0-9]*$ ]]
            then
                echo "無效的數量，請輸入正整數。"
                sleep 2
                continue
            else
                let total_price2_tmp=${product_prices[2]}*$quantity2
                echo -e "$total_price2_tmp \$"
                let quantity2_total=$quantity2_total+$quantity2
                let total_price2=$total_price2+$total_price2_tmp
                sleep 2
                continue
            fi
            ;;
        3 )
            read -p "請輸入數量: " quantity3
            [ -z $quantity3 ] 2> /dev/null && echo "please enter quantity." && continue
            if ! [[ "$quantity3" =~  ^-?[1-9][0-9]*$ ]]
            then
                echo "無效的數量，請輸入正整數。"
                sleep 2
                continue
            else
                let total_price3_tmp=${product_prices[3]}*$quantity3
                echo -e "$total_price3_tmp \$"
                let quantity3_total=$quantity3_total+$quantity3
                let total_price3=$total_price3+$total_price3_tmp
                sleep 2
                continue
            fi
            ;;
        4 )
            export total_price1=${total_price1:-"0"}
            export total_price2=${total_price2:-"0"}
            export total_price3=${total_price3:-"0"}
            export quantity1_total=${quantity1_total:-0}
            export quantity2_total=${quantity2_total:-0}
            export quantity3_total=${quantity3_total:-0}
            export products1=${products[1]}
            export products2=${products[2]}
            export products3=${products[3]}
            ./tea.3.10.txt
            ;;
        * )
            echo -e "\n\aNo function in $varKey"
            varKey=0
            ;;

     esac
     read -n 1 -p "Press any key to continue..."
done

exit 0

