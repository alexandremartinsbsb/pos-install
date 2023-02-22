#!/usr/bin/env bash

echo -e "Iniciando script"

## CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

echo -e "${VERDE}[INFO] - Atualizando o sistema${SEM_COR}"
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/* && sudo rm -f /var/lib/dpkg/lock && sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y sudo flatpak repair && sudo flatpak update -y && sudo flatpak uninstall --unused -y

echo -e "${VERDE}[INFO] - Instalando Flatpak${SEM_COR}"

sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
sudo flatpak update -y

echo -e "${VERDE}[INFO] - Atualizando o sistema${SEM_COR}"
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/* && sudo rm -f /var/lib/dpkg/lock && sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y sudo flatpak repair && sudo flatpak update -y && sudo flatpak uninstall --unused -y

echo -e "${VERDE}[INFO] - Instalando pacotes via Flatpak${SEM_COR}"

#sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y
#sudo flatpak install flathub com.github.muriloventuroso.easyssh -y
#sudo flatpak install flathub org.gnome.meld -y
#sudo flatpak install flathub com.syntevo.SmartGit -y
#sudo flatpak install flathub org.gabmus.hydrapaper -y
#sudo flatpak install flathub org.telegram.desktop -y
sudo flatpak install flathub com.slack.Slack -y
#sudo flatpak install flathub com.jetbrains.IntelliJ-IDEA-Ultimate -y
sudo flatpak install flathub com.sublimetext.three -y
sudo flatpak install flathub com.getpostman.Postman -y
#sudo flatpak install flathub com.spotify.Client -y
#sudo flatpak install flathub org.eclipse.Java -y
#sudo flatpak install flathub com.google.AndroidStudio -y
#sudo flatpak install flathub org.gimp.GIMP -y

#finalizacao
echo -e "${VERDE}[INFO] - Script finalizado, instalacao concluida! :)${SEM_COR}"
