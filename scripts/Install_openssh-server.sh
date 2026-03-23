#!/bin/bash
while true
do
    read -p "Ce script permet d'installer le openssh-server et de l'activiter. Voulez vous le faire ? O/N " user_choix
    if [ $user_choix == "O" ] || [ $user_choix == "o" ]; then
        echo "Lancement du programme d'installation et d'activation..."
        sudo apt install openssh-server -y
        sudo systemctl strat ssh
        echo "Fin de l'installation"
    elif [ $user_choix == "N" ] || [ $user_choix == "n" ]; then
        echo "D'accord."
        break
    else
        continue
    fi
done
