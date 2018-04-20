#!/bin/bash
echo "Please enter your ngrok AUTH-TOKEN :"
read ngrokauth
apt-get install lib32stdc++6 lib32ncurses5 lib32z1 -y
apt-get install zipalign -y
apt-get install xterm -y
sudo apt-get install python-dev python-pip libncurses5-dev git -y
apt-get autoremove -y
cd ~/set2/
wget http://download1650.mediafire.com/83559xay5qng/t56xwz2iw74u655/tools.tar.xz
tar xvfJ tools.tar.xz
chmod +x set2.sh
mkdir temp
mv fud ~/set2/temp
mkdir output
mkdir tools
mv generate_wan.py ~/set2/tools/
mv generate_lan.py ~/set2/tools/
rm tools.zip
cd ~/set2/tools
git clone https://github.com/OWASP/QRLJacking.git
cd QRLJacking
mv QrlJacking-Framework ~/set2/tools
cd ~/set2/tools
rm -rf QRLJacking
cd QrlJacking-Framework
pip install -r requirements.txt
cd ~/set2/tools
git clone https://github.com/UndeadSec/SocialFish.git
cd SocialFish
sudo pip install -r requirements.txt
cd ~/set2/tools
git clone https://github.com/M3-SEC/spoofmail.git
cd spoofmail
chmod +x spoofmail.sh
cd ~/set2/tools
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
rm ngrok-stable-linux-amd64.zip
./ngrok authtoken $ngrokauth






cd
echo "alias set2='bash ~/set2/set2.sh'" >> .bashrc
clear