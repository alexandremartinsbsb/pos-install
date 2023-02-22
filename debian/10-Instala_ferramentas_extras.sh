#!/usr/bin/env bash

echo -e "Iniciando script"

## CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

echo -e "${VERDE}[INFO] - Atualizando o sistema${SEM_COR}"
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/* && sudo rm -f /var/lib/dpkg/lock && sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y sudo flatpak repair && sudo flatpak update -y && sudo flatpak uninstall --unused -y

echo -e "${VERDE}[INFO] - Instalando ferramentas adicionais${SEM_COR}"

sudo apt install $(apt search gnome-shell-extension | grep ^gnome | cut -d / -f1) -y
sudo apt install alacarte -y
sudo apt install build-essential -y
sudo apt install apt-listchanges -y
sudo apt install apt-listbugs -y
sudo apt install xarchiver -y
sudo apt install p7zip-full -y
sudo apt install rar -y
sudo apt install numlockx -y
sudo apt install inxi -y
sudo apt install htop -y
sudo apt install ttf-mscorefonts-installer -y
sudo apt install firmware-linux-nonfree -y
sudo apt install blueman -y

#finalizacao
echo -e "${VERDE}[INFO] - Script finalizado, instalacao concluida! :)${SEM_COR}"
