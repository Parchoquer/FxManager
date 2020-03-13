#!/bin/bash
# By Parchoquer

screenName="fxServerDev"    # Nom de la session screen
data="/home/$USER/fxdev/server-data"     # Chemin server-data
pathServer="/home/$USER/fxdev"       # Chemin de la racine du serveur
cache="/home/$USER/fxdev/server-data/cache"     #Chemin du cache serveur
latestRelease="`wget -q -O - https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/ | grep 'primary' | grep -Po '(?<=href="./).{45}'`"    # ne pas changer sauf si vous savez ce que vous faite !

echo -e "\n"
for i in {16..21} {21..16} ; do echo -en "\e[48;5;${i}m       \e[0m" ; done ; echo
echo -e "\n                                     \e[91m\e[4mFx Manager\e[24m\e[39m \n\n"

if [[ $(screen -ls | grep $screenName | awk '{ print $1}' | cut -d '.' -f2-) == "$screenName" ]]; then
    echo -n -e "\e[42m[+]\e[49m Le serveur est démarré que voulez vous faire ? (stop/reboot/console/quit)\n> "
    read choice

    case $choice in
        "stop" | "sp")
            echo -e "\e[46m[+]\e[49m Arrêt du serveur.."
            screen -X -S $screenName quit
            ;;
        "reboot" | "r")
            echo -e "\e[46m[+]\e[49m Redémarrage en cours.."
            screen -X -S $screenName quit
            sleep 4
            rm -r $cache
            sleep 1
            screen -S $screenName -dm bash -c 'cd '$data'; bash '$pathServer'/run.sh +exec server.cfg;'
            sleep 10
            echo -e "\e[46m[+]\e[49m Serveur démarré !"
            ;;
        "console" | "c")
            echo -e "\n\n\n\n\e[41m\e[31m======================================================================\e[39m\e[49m"
            echo -e "\nQuitter SEULEMENT avec CTRL A puis D si non vous cassé le processus !!\n"
            echo -e "\e[41m\e[31m======================================================================\e[39m\e[49m\n\n"
            read -s -n1 -p "Appuyez sur une touche pour continuer.."; echo
            screen -R $screenName
            ;;
        "quit" | "q")
            echo -e "\e[46m[+]\e[49m bye !"
            ;;
    esac
else
echo -n -e "\e[101m[+]\e[49m Le serveur est éteint que voulez vous faire ? (start/update/quit)\n> "
read reChoice

    case $reChoice in
        "start" | "st")
            echo -e "\e[46m[+]\e[49m Lancement du serveur.."
            rm -r $cache
            sleep 1
            screen -S $screenName -dm bash -c 'cd '$data'; bash '$pathServer'/run.sh +exec server.cfg;'
            sleep 10
            echo -e "\e[46m[+]\e[49m Serveur prêt !\nBon jeux !"
            ;;
        "update" | "u")
            echo -e "\e[46m[+]\e[49m Lancement de la mise a jour .."
            echo -e "\e[46m[+]\e[49m Téléchargement des nouveaux artefacts"
            wget -q --show-progress "https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/$latestRelease/fx.tar.xz" -P $pathServer
            echo -e "\e[46m[+]\e[49m Décompression fx.tar.xz.."
            sleep 1
            cd $pathServer
            tar xvfJ $pathServer/fx.tar.xz
            echo -e "\e[46m[+]\e[49m Suppression de l'archive.."
            rm $pathServer/fx.tar.xz
            echo -e "\e[46m[+]\e[49m Mise à jour terminer !"
            ;;
        "quit" | "q")
            echo -e "\e[46m[+]\e[49m Bye !"
            ;;
    esac
fi