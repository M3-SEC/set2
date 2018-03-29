#!/bin/bash

clear
echo "                  ███████╗███████╗████████╗";
echo "                  ██╔════╝██╔════╝╚══██╔══╝";
echo "                  ███████╗█████╗     ██║   ";
echo "                  ╚════██║██╔══╝     ██║   ";
echo "                  ███████║███████╗   ██║   ";
echo "                  ╚══════╝╚══════╝   ╚═╝   ";
echo "                  M3-Sec.        V: 0.01   ";
echo "     The new Social Engineering toolkit with new tools.";
echo "1)      QR-Code Attacks"
echo "2)      Spoofmail"
echo "3)      Phishing"
echo "4)      "
echo "0)      Exit"
read menu
if [[ $menu = 1 ]]; then
    cd ~/set/tools/QrlJacking-Framework
    python QRLJacker.py
elif [[ $menu = 2 ]]; then
    cd ~/set/tools/spoofmail
    ./spoofmail.sh
elif [[ $menu = 3 ]]; then
    cd ~/set/tools/SocialFish
    python SocialFish.py








elif [[ $menu = 0 ]]; then
    exit
else
    clear
    echo "?"
    ./set.sh
fi
