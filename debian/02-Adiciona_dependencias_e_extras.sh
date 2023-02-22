#!/usr/bin/env bash

echo -e "Iniciando script"

## CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

echo -e "${VERDE}[INFO] - Atualizando o sistema${SEM_COR}"
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/* && sudo rm -f /var/lib/dpkg/lock && sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y sudo flatpak repair && sudo flatpak update -y && sudo flatpak uninstall --unused -y


echo -e "${VERDE}[INFO] - Instalando dependencias${SEM_COR}"
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 7A3A762FAFD4A51F
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 5E3C45D7B312C643
sudo apt install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev -y
sudo apt install g++ build-essential qt5-qmake qttools5-dev-tools -y
sudo apt install libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5-dev -y
sudo apt install gtk2-engines-murrine libglib2.0-dev libxml2-utils -y
#sudo apt install gnome-themes-standard gtk2-engines-murrine libglib2.0-dev libxml2-utils -y
sudo apt install git openssl ca-certificates -y
sudo apt install apt-transport-https -y
sudo apt install wget gpg -y
sudo apt install curl -y
sudo apt install -y sassc
sudo apt install zip -y
sudo apt install unrar -y
sudo apt install wget -y
sudo cp trusted.gpg trusted.gpg.d
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['']"

#finalizacao
echo -e "${VERDE}[INFO] - Script finalizado, instalacao concluida! :)${SEM_COR}"
