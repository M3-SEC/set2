#!/bin/bash

mkdir tools
cd tools
sudo apt-get install python-dev python-pip libncurses5-dev git
git clone https://github.com/OWASP/QRLJacking.git
cd QRLJacking
mv QrlJacking-Framework ~/set/tools
cd ..
rm -rf QRLJacking
cd QrlJacking-Framework
pip install -r requirements.txt
cd ..
git clone https://github.com/UndeadSec/SocialFish.git
cd SocialFish
sudo pip install -r requirements.txt
cd ..
git clone https://github.com/M3-SEC/spoofmail.git
cd spoofmail
chmod +x spoofmail.sh
cd ..
