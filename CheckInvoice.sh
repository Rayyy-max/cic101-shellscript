#!/bin/bash
check_invoice() {
    if [[ $1 =~ ^[A-Z]{2}[0-9]{8}$ ]]
    then
        return 0
    else
        return 1
    fi
}

check_won_or_not() {
    while read rows1
    do
        while read rows2
        do
            price_number=$(echo "$rows2" | cut -d '.' -f1)
            invoice_number=$(echo "$rows2" | cut -d '.' -f2)
            if [ "$rows1" == "$invoice_number" ]
            then
                echo "$rows1 won $price_number price!"
                break
            elif [ "$rows2" == "end" ]
            then
                echo "$rows1 make persistent efforts "
            fi
        done < won.txt
    done < invoice.txt
}

echo "When nothing to do, please enter 'end' to leave. "

until false
do
    read -p "Please enter what do you want to do or invoice numbers: " invoice_number
    echo ""cat" to echo all the invoices; "clean" to clean up all the invoices; "check"; "build""
    if [ "$invoice_number" == "end" ] 2> /dev/null
    then
        echo "complete."
        break

    elif [ "$invoice_number" == "cat" ] 2> /dev/null
    then
        touch invoice.txt
        cat invoice.txt
        echo ""
        continue

    elif [ "$invoice_number" == "clean" ] 2> /dev/null
    then
        rm invoice.txt
        echo -e "complete!\n "
        continue

    elif [ "$invoice_number" == "check" ] 2> /dev/null
    then
        check_won_or_not
           
    elif [ "$invoice_number" == "build" ] 2> /dev/null
    then
        echo "" > won.txt
        while true
        do
            read -p "Please enter price number: " price_number
            if [ "$price_number" == "end" ]
            then
                echo "build complete."
                echo "$price_number" >> won.txt
                break
            fi
            read -p "Please enter invoice number: " invoice_number
            if check_invoice "$invoice_number"
            then
                echo "$price_number.$invoice_number" >> won.txt
            else
                echo -e "wrong invoice number!\n"
            fi
        done

    elif check_invoice "$invoice_number"
    then
        echo -e "invoices saved successfully.\n"
        echo "$invoice_number" >> invoice.txt
    else
        echo -e "invoice number invalid, please enter again!\n"
    fi
done
