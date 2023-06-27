#!/bin/bash

AZUL1='\033[94m'
AZUL2='\033[95m'
AZUL3='\033[96m'
ROJO='\033[91m'
VERDE='\033[92m'
NARANJA='\033[93m'
RC='\e[0m'
COLOROFF='\033[0m' 


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


echo -e "$RC"
echo -e "$RC"         
echo -e "$AZUL1   ____    _                     _                  _      "
echo -e "$AZUL1  / ___|  | |__     ___   _ __  | |   ___     ___  | | __  "
echo -e "$AZUL2  \___ \  | '_ \   / _ \ | '__| | |  / _ \   / __| | |/ /  "
echo -e "$AZUL2   ___) | | | | | |  __/ | |    | | | (_) | | (__  |   <   "
echo -e "$AZUL3  |____/  |_| |_|  \___| |_|    |_|  \___/   \___| |_|\_\  "
echo -e "$RC"
echo -e "$AZUL1                        _      _                  "  
echo -e "$AZUL1                       | |    (_)                 "
echo -e "$AZUL1                       | |     _ _ __  _   ___  __"
echo -e "$AZUL2                       | |    | | '_ \| | | \ \/ /"
echo -e "$AZUL2                       | |____| | | | | |_| |>  < "
echo -e "$AZUL3                       |______|_|_| |_|\__,_/_/\_\  v.1"
echo -e "$RC"
echo -e "$AZUL Este script convertirá tu SO Debian en una distribución dedicada" 
echo -e "$AZUL a la obtención de información en fuentes abiertas, realizará las" 
echo -e "$AZUL siguientes acciones:"
echo -e "$RC"
echo -e "$AZUL 1. Instalará las aplicaciones más utilizadas en OSINT para la recoleción"
echo -e "$AZUL de información en fuentes abiertas."
echo -e "$RC"
echo -e "$AZUL 2. Personalizará el menú de escritorio para tener las aplicaciones accesibles"
echo -e "$AZUL por categorías."
echo -e "$RC"
echo -e "$AZUL 3. Configurará los navegadores Google Chrome y Mozilla Firefox con gran"
echo -e "$AZUL cantidad de recursos para OSINT."
echo -e "$RC"
echo -e "$AZUL Para más información puede visitar la web $AZUL3 www.sherlock-linux.org"
echo -e "$RC"
echo -e "$NARANJA [Pulsa intro para comenzar] ====>>>>>>>>"
read -p ""
echo -e "$RC"


sudo apt -y update && sudo apt -y upgrade

sudo apt install -y git
sudo apt install -y curl
sudo apt install -y default-jre
sudo apt install -y python3
sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo apt install -y zip
sudo apt install -y libglib2.0-dev
sudo apt install -y wget

sudo apt remove -y xterm
sudo apt purge -y xterm
sudo apt install -y gnome-terminal
sudo apt install -y dbus-x11
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false
gsettings set org.gnome.desktop.sound event-sounds false

sudo apt install -y network-manager
sudo apt install -y network-manager-gnome
sudo systemctl enable NetworkManager.service

mkdir  ~/Programs
cd ~/Programs
wget -c https://go.dev/dl/go1.20.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
rm go1.20.4.linux-amd64.tar.gz

echo -e "$VERDE Dependencias instaladas! $RC"
echo -e "$RC"
 
#sudo add-apt-repository multiverse
#sudo apt install -y virtualbox-guest-dkms virtualbox-guest-x11
#sudo adduser osint vboxsf

sudo apt install -y open-vm-tools
sudo apt install -y open-vm-tools-desktop

echo -e "$VERDE Requerimientos para máquinas virtuales instalados! $RC"
echo -e "$RC"

sudo mv /usr/share/images/desktop-base/desktop-grub.png /usr/share/images/desktop-base/desktop-grubBACKUP.png
sudo cp $SCRIPT_DIR/imagenes/desktop-grub.png /usr/share/images/desktop-base/desktop-grub.png
sudo mv /etc/default/grub /etc/default/grubBACKUP
sudo cp $SCRIPT_DIR/other/grub /etc/default/grub
sudo update-grub


sudo cp $SCRIPT_DIR/imagenes/desktop-background.png /usr/share/images/desktop-base/default
sudo cp /home/sherlock/sherlocklinux/imagenes/login-background.svg /usr/share/images/desktop-base/login-background.svg


sudo apt install -y lightdm-gtk-greeter-settings
sudo mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.confBACKUP
sudo cp $SCRIPT_DIR/other/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
sudo cp $SCRIPT_DIR/imagenes/sherlock.png /usr/share/images/desktop-base/sherlock.png
default-user-image = /usr/share/images/desktop-base/sherlock.png


echo -e "$VERDE Estilos aplicados! $RC"
echo -e "$RC"

echo -e "$AZUL3 Instalando Firefox..."
sudo apt install -y firefox-esr
echo -e "$VERDE Firefox Instalado $RC"

echo -e "$AZUL3 Instalando Google Chome..."
echo -e "$COLOROFF"
lsb_release -a
cd ~/Programs
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install -y
rm -R ~/Programs/google-chrome-stable_current_amd64.deb
echo -e "$VERDE Google Chome instalado $RC"
echo -e "$RC"


#Its possible that the link doesnt work, in this case change the url with the correct one
echo -e "$AZUL3 Instalando Tor..."
echo -e "$COLOROFF"
cd ~/Programs
wget -c https://www.torproject.org/dist/torbrowser/12.5/tor-browser-linux64-12.5_ALL.tar.xz
tar -xvf tor-browser-linux64-*.tar.xz
rm -R ~/Programs/tor-browser-linux64-*.tar.xz
cd ~/Programs/tor-browser
./start-tor-browser.desktop --register-app
echo -e "$VERDE Tor instalado $RC"
echo -e "$RC"


echo -e "$VERDE Navegadores instalados! $RC"
echo -e "$RC"


echo -e "$AZUL3 Configurando Mozilla Firefox... $RC"
export DISPLAY=:0
firefox-esr &
sleep 5
pkill -f firefox
mkdir ~/Programs/firefox
unzip $SCRIPT_DIR/firefox.zip -d ~/Programs/firefox
\cp -R ~/Programs/firefox/* ~/.mozilla/firefox/*.default-esr
rm -R ~/Programs/firefox
rm -R $SCRIPT_DIR/firefox.zip
echo -e "$VERDE Mozilla Firefox Configurado $RC"
echo -e "$RC"


echo -e "$AZUL3 Configurando Google Chrome... $RC"
pkill --oldest chrome
mkdir ~/Programs/chrome
mkdir -p ~/.config/google-chrome
unzip $SCRIPT_DIR/chrome.zip -d ~/Programs/chrome
cp -R ~/Programs/chrome/* ~/.config/google-chrome
rm -R ~/Programs/chrome
rm -R $SCRIPT_DIR/chrome.zip
echo -e "$VERDE Google Chrome configurado $RC"
echo -e "$RC"


echo -e "$AZUL3 Instalando Maltego... $RC"
mkdir  ~/Programs/maltego && cd  ~/Programs/maltego
wget -c https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.4.1.deb
sudo dpkg -i Maltego.v4.4.1.deb
sudo apt install -y maltego
rm ~/Programs/maltego/Maltego.v4.4.1.deb
echo -e "$VERDE Maltego instalado $RC"
 

echo -e "$AZUL3 Instalando Google Earth Pro... $RC"
mkdir  ~/Programs/google-earth && cd  ~/Programs/google-earth
wget https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb
sudo apt install -y ~/Programs/google-earth/google-earth-pro-stable_current_amd64.deb
rm ~/Programs/google-earth/google-earth-pro-stable_current_amd64.deb
echo -e "$VERDE Google Earth Pro instalado $RC"


echo -e "$AZUL3 Visual Studio Code... $RC"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code
echo -e "$VERDE Visual Studio Code $RC"


echo -e "$VERDE Instalando webhttrack $RC"
sudo apt install -y webhttrack 
echo -e "$VERDE Webhttrack instalado $RC"


echo -e "$AZUL3 Instalando Yacy... $RC"
mkdir ~/Programs/yacy
cd ~/Programs/yacy
sudo dpkg --configure -a
wget https://download.yacy.net/yacy_v1.924_20210209_10069.tar.gz
tar xfz yacy_v1.924_20210209_10069.tar.gz
rm yacy_v1.924_20210209_10069.tar.gz
echo -e "$VERDE Yacy Instalado $RC"
echo -e "$RC"


echo -e "$AZUL3 Instalando Phoneinfoga... $RC"
mkdir ~/Programs/phoneinfoga
cd ~/Programs/phoneinfoga
bash <( curl -sSL https://raw.githubusercontent.com/sundowndev/phoneinfoga/master/support/scripts/install )
sudo install ./phoneinfoga /usr/local/bin/phoneinfoga
echo -e "$VERDE Phoneinfoga instalado $RC"


echo -e "$AZUL3 Instalando WhatWeb.. $RC"
sudo apt install -y whatweb
echo -e "$VERDE WhatWeb instalado $RC"


echo -e "$AZUL3 Instalando XRay... $RC"
git clone https://github.com/evilsocket/xray.git  ~/Programs/XRay/
cd  ~/Programs/XRay/
wget  https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
rm go1.20.2.linux-amd64.tar.gz
make
echo -e "$VERDE XRay instalado $RC"


echo -e "$AZUL3 Instalando Certgraph.. $RC"
git clone https://github.com/lanrat/certgraph.git  ~/Programs/certgraph
cd  ~/Programs/certgraph
make
go build -o certgraph certgraph.go
echo -e "$VERDE Certgraph instalado $RC"


echo -e "$AZUL3 Instalando VLC.. $RC"
sudo apt -y install vlc
echo -e "$VERDE VLC instalado $RC"


echo -e "$AZUL3 Instalando Spiderfoot... $RC"
mkdir ~/Programs/spiderfoot
cd  ~/Programs/spiderfoot
wget https://github.com/smicallef/spiderfoot/archive/v4.0.tar.gz
tar zxvf v4.0.tar.gz
rm v4.0.tar.gz
python3 -m venv ~/Programs/spiderfoot/spiderfoot-venv
source spiderfoot-venv/bin/activate
cd spiderfoot-4.0
pip3 install -r requirements.txt
deactivate


echo -e "$AZUL3 Instalando Bbot... $RC"
mkdir -p  ~/Programs/bbot/
cd ~/Programs/bbot/
python3 -m venv ~/Programs/bbot/bbot-venv
source bbot-venv/bin/activate
pip3 install bbot
bbot --install-all-deps
deactivate
echo -e "$VERDE Bbot instalado $RC"
 

echo -e "$AZUL3 Instalando Pagodo... $RC"
git clone https://github.com/opsdisk/pagodo.git  ~/Programs/pagodo/
cd  ~/Programs/pagodo/
python3 -m venv pagodo-venv
source pagodo-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE Pagodo instalado $RC"
 

echo -e "$AZUL3 Instalando Scanless... $RC"
git clone https://github.com/vesche/scanless  ~/Programs/scanless/
cd  ~/Programs/scanless/
python3 -m venv scanless-venv
source scanless-venv/bin/activate
pip install scanless
deactivate
echo -e "$VERDE Scanless instalado $RC"


echo -e "$AZUL3 Instalando theHarvester... $RC"
git clone https://github.com/laramies/theHarvester.git  ~/Programs/theHarvester/
cd  ~/Programs/theHarvester
python3 -m venv ~/Programs/theHarvester/theHarvester-venv
source theHarvester-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE theHarvester instalado $RC"
 

echo -e "$AZUL3 Instalando Sherlock... $RC"
git clone https://github.com/sherlock-project/sherlock.git  ~/Programs/Sherlock
cd  ~/Programs/Sherlock
python3 -m venv ~/Programs/Sherlock/Sherlock-venv
source Sherlock-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE Sherlock instalado $RC"


echo -e "$AZUL3 Instalando Photon... $RC"
git clone https://github.com/s0md3v/Photon.git  ~/Programs/Photon/
cd  ~/Programs/Photon/
python3 -m venv Photon-venv
source Photon-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE Photon instalado $RC"
 

echo -e "$AZUL3 Instalando CloudFail... $RC"
git clone https://github.com/m0rtem/CloudFail.git  ~/Programs/CloudFail/
cd  ~/Programs/CloudFail/
python3 -m venv CloudFail-venv
source CloudFail-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE CloudFail instalado $RC"
 

echo -e "$AZUL3 Instalando CloudScraper... $RC"
git clone https://github.com/jordanpotti/CloudScraper.git  ~/Programs/CloudScraper/
cd  ~/Programs/CloudScraper/
python3 -m venv CloudScraper-venv
source CloudScraper-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE CloudScraper instalado $RC"


echo -e "$AZUL3 Instalando DNSRecon... $RC"
git clone https://github.com/darkoperator/dnsrecon.git  ~/Programs/DNSRecon/
cd  ~/Programs/DNSRecon/
python3 -m venv DNSRecon-venv
source DNSRecon-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE DNSRecon instalado $RC"
 

echo -e "$AZUL3 Instalando Hostintel... $RC"
git clone https://github.com/keithjjones/hostintel.git  ~/Programs/Hostintel/
cd  ~/Programs/Hostintel/
python3 -m venv Hostintel-venv
source Hostintel-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE Hostintel instalado $RC"


echo -e "$AZUL3 Instalando Infoga... $RC"
git clone https://github.com/m4ll0k/Infoga.git  ~/Programs/infoga/
cd  ~/Programs/infoga/
python3 -m venv infoga-venv
source infoga-venv/bin/activate
pip install -r requirements.txt
deactivate
echo -e "$VERDE Infoga instalado $RC"
 

echo -e "$AZUL3 Instalando GitRecon... $RC"
git clone https://github.com/GONZOsint/gitrecon.git  ~/Programs/gitrecon/
cd  ~/Programs/gitrecon/
python3 -m venv gitrecon-venv
source gitrecon-venv/bin/activate
python3 -m pip install -r requirements.txt
deactivate
echo -e "$VERDE GitRecon instalado $RC"


echo -e "$AZUL3 Instalando ExifTool.. $RC"
mkdir -p  ~/Programs/ExifTool/
cd  ~/Programs/ExifTool/
wget  https://exiftool.org/Image-ExifTool-12.63.tar.gz
tar xfz Image-ExifTool-12.63.tar.gz
rm Image-ExifTool-12.63.tar.gz
echo -e "$VERDE Exiftool instalado $RC"


echo -e "$AZUL3 Instalando EyeWitness... $RC"
git clone https://github.com/RedSiege/EyeWitness.git  ~/Programs/eyewitness/
cd ~/Programs/eyewitness
python3 -m venv ~/Programs/eyewitness/eyewitness-venv
source eyewitness-venv/bin/activate
cd  ~/Programs/eyewitness/Python/setup
sudo bash setup.sh
pip3 install netaddr
pip3 install selenium
pip3 install fuzzywuzzy
pip3 install pyvirtualdisplay
deactivate
echo -e "$VERDE EyeWitness instalado $RC"
echo -e "$RC"


echo -e "$AZUL3 Instalando Metagoofil... $RC"
git clone https://github.com/opsdisk/metagoofil  ~/Programs/metagoofil/
cd ~/Programs/metagoofil/
python3 -m venv ~/Programs/metagoofil/metagoofil-venv
source metagoofil-venv/bin/activate
pip3 install -r requirements.txt
echo -e "$VERDE Metagoofil instalado $RC"


echo -e "$AZUL3 Instalando OSFramework... $RC"
mkdir -p ~/Programs/osrframework/
cd ~/Programs/osrframework/
python3 -m venv ~/Programs/osrframework/osrframework-venv
source osrframework-venv/bin/activate
pip3 install pip==21.2
pip3 install osrframework
pip3 install 'urllib3<2'
deactivate
echo -e "$VERDE OSRFramework instalado $RC"


echo -e "$AZUL3 Instalando eo-ripper... $RC"
git clone https://github.com/Quantika14/email-osint-ripper.git ~/Programs/eo-ripper/
cd ~/Programs/eo-ripper/
python3 -m venv ~/Programs/eo-ripper/eo-ripper-venv
source eo-ripper-venv/bin/activate
pip3 install -r requeriments.txt
pip3 install requests
deactivate
echo -e "$VERDE eo-ripper instalado $RC"


echo -e "$AZUL3 Instalando Instaloader... $RC"
mkdir -p ~/Programs/instaloader/
cd ~/Programs/instaloader/
python3 -m venv ~/Programs/instaloader/instaloader-venv
source instaloader-venv/bin/activate
pip3 install instaloader
deactivate
echo -e "$VERDE Instaloader instalado $RC"


echo -e "$AZUL3 Instalando ProtOSINT... $RC"
git clone https://github.com/pixelbubble/ProtOSINT.git ~/Programs/protosint/
python3 -m venv ~/Programs/protosint/protosint-venv
cd ~/Programs/protosint/
source protosint-venv/bin/activate
pip3 install requests
deactivate
echo -e "$VERDE Instaloader instalado $RC"


sudo mkdir -p /usr/share/sherlock-menu/
sudo cp $SCRIPT_DIR/scripts/exec-in-shell /usr/share/sherlock-menu/
sudo chmod +x /usr/share/sherlock-menu/exec-in-shell

mkdir -p ~/iconos
sudo cp $SCRIPT_DIR/menu/iconos/* ~/iconos/

mkdir -p ~/.local/share/applications/
sudo cp $SCRIPT_DIR/menu/desktop/*.desktop ~/.local/share/applications/

mkdir -p ~/.config/menus/
sudo mv /etc/xdg/menus/xfce-applications.menu ~/.config/menus/xfce-applications.menuBACKUP
sudo cp $SCRIPT_DIR/menu/xfce-applications.menu ~/.config/menus/

mkdir -p ~/.local/share/desktop-directories/
cp $SCRIPT_DIR/menu/desktop-directories/*.directory ~/.local/share/desktop-directories/

sudo cp $SCRIPT_DIR/scripts/* /usr/bin/


sudo chmod +x /usr/bin/certgraph
sudo chmod +x /usr/bin/bbot
sudo chmod +x /usr/bin/cloudfail
sudo chmod +x /usr/bin/CloudScraper
sudo chmod +x /usr/bin/EyeWitness
sudo chmod +x /usr/bin/gitrecon
sudo chmod +x /usr/bin/hostintel
sudo chmod +x /usr/bin/infoga
sudo chmod +x /usr/bin/iocextract
sudo chmod +x /usr/bin/pagodo
sudo chmod +x /usr/bin/photon
sudo chmod +x /usr/bin/sherlock
sudo chmod +x /usr/bin/scanless
sudo chmod +x /usr/bin/startYACY
sudo chmod +x /usr/bin/stopYACY
sudo chmod +x /usr/bin/theHarvester
sudo chmod +x /usr/bin/xray
sudo chmod +x /usr/bin/dnsrecon
sudo chmod +x /usr/bin/exiftool
sudo chmod +x /usr/bin/metagoofil
sudo chmod +x /usr/bin/sf
sudo chmod +x /usr/bin/sfcli
sudo chmod +x /usr/bin/osrf
sudo chmod +x /usr/bin/eo-ripper
sudo chmod +x /usr/bin/instaloader
sudo chmod +x /usr/bin/protosint


echo -e "$VERDE Menús y accesos directos creados $RC"
echo -e "$RC"


echo -e "$COLOROFF"
sudo apt autoremove -y --purge
sudo apt clean -y
sudo journalctl --vacuum-time=3d
sudo apt remove -y $(dpkg-query --show 'linux-modules-*' | cut -f1 | grep -v "$(uname -r)")
sudo find /var/log/ -type f -exec cp /dev/null {} \;
rm -rf ~/.cache/*


echo -e "$AZUL3 A continuación se reiniciará el sistema para aplicar los últimos cambios"
echo -e "$NARANJA Pulsa intro para continuar"
read -p ""
systemctl reboot