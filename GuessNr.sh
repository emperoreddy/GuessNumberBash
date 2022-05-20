#!/bin/bash

#GHICESTE NUMARUL   

ghicesteNr(){

    echo "Introdu limita pe care o poate atinge numarul: " #EX: 50 ca sa genereze un nr intre 1 si 50
    read -r limita

    random=$(( RANDOM % limita + 1 )) #Generearea unui nr random pana in limita aleasa

    echo "Ghiceste numarul/cifra generata: "
    read -r numarAles

    declare -i count #Variabila pentru a vedea de cate ori a trebuit sa ghicesti numarul

    #Atata timp cat numarul nu este corect, se ghiceste iar
    while [[ $numarAles -ne $random ]]
    do

        echo "Gresit, ghiceste din nou: "
        read -r numarAles
        ((count+=1)) #Incrementare count

    done

    #Daca numarul este ghicit din prima, se termina subprogramul
    if [[ $numarAles -eq $random ]]; then
            echo "Ai ghicit numarul $random din a $count incercare!!"
            return 1
    fi
}

#Joc nou daca se doreste continuarea acestuia
jocNou() {
    echo "Doresti sa joci din nou? Y\n"
    read -r decizie

    if [[ $decizie = 'Y' || $decizie = 'y' ]]; then
        ghicesteNr;
        jocNou;
    elif [[ $decizie = 'N' || $decizie = 'n' ]]; then
        #figlet GAME OVER           #Text la final cu game over (trebuie instalat cu 'sudo apt install figlet')
        echo "~ GAME OVER ~"
        return 1
    fi
    
}

#---- MAIN -----

ghicesteNr;
jocNou;
