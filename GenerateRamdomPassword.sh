#!/bin/bash
#Ray

letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
numbers=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9")

read -p "How many characters does your password need?" length

[ -z $length ] 2> /dev/null && echo "please enter some number." && exit 1
read -p "How many ENGLISH characters does your password need?" letter_count
read -p "How many NUMBERS does your password need?" number_count
if [ $((letter_count + number_count)) -ne $length ]; then
    echo "Error: The total of letters and numbers must equal the password length."
    exit 1
fi

read -p "How many passwords do you need?" quota

if [ $((letter_count + number_count)) -ne $length ]; then
    echo "Error: The total of letters and numbers must equal the password length."
    exit 1
fi

letters1=${#letters[@]}
numbers1=${#numbers[@]}

for x in $(seq 1 $quota)
do
   password=""
         for i in $(seq 1 $letter_count)
         do
           password+="${letters[$((RANDOM % letters1))]}"

         done

         for i in $(seq 1 $number_count)
         do
           password+="${numbers[$((RANDOM % numbers1))]}"
         done

         password=$(echo "$password" | fold -w1 | shuf | tr -d '\n')

   echo "$password"
done

exit 0
