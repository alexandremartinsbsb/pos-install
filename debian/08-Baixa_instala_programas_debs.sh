#!/usr/bin/env bash

echo -e "Iniciando script"

## CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

echo -e "${VERDE}[INFO] - Atualizando o sistema${SEM_COR}"
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/* && sudo rm -f /var/lib/dpkg/lock && sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y sudo flatpak repair && sudo flatpak update -y && sudo flatpak uninstall --unused -y

echo -e "${VERDE}[INFO] - Baixando pacotes .deb${SEM_COR}"

## URLs
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_GITHUB_DESKTOP="https://github.com/shiftkey/desktop/releases/download/release-3.1.7-linux1/GitHubDesktop-linux-3.1.7-linux1.deb"
URL_TEAMVIEW="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
URL_ETCHER="https://github.com/balena-io/etcher/releases/download/v1.18.1/balena-etcher_1.18.1_amd64.deb"
URL_COMPASS="https://downloads.mongodb.com/compass/mongodb-compass_1.35.0_amd64.deb"
URL_SKYPE="https://go.skype.com/skypeforlinux-64.deb"
URL_DBEAVER="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
URL_SMARTGIT="https://www.syntevo.com/downloads/smartgit/smartgit-22_1_4.deb"

## DIRETORIO E ARQUIVOS
DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"   -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GITHUB_DESKTOP"  -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_TEAMVIEW"        -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_ETCHER"          -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_COMPASS"         -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_SKYPE"           -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_DBEAVER"         -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_SMARTGIT"        -P "$DIRETORIO_DOWNLOADS"

echo -e "${VERDE}[INFO] - Instalando pacotes .deb baixados${SEM_COR}"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg --force-depends -i $DIRETORIO_DOWNLOADS/*.deb

sudo apt --fix-broken install -y

sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d

sudo rm -rf "$DIRETORIO_DOWNLOADS"

#finalizacao
echo -e "${VERDE}[INFO] - Script finalizado, instalacao concluida! :)${SEM_COR}"
