#!/usr/bin/env bash

echo -e "Iniciando script"

## CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

echo -e "${VERDE}[INFO] - Atualizando o sistema${SEM_COR}"
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/* && sudo rm -f /var/lib/dpkg/lock && sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y sudo flatpak repair && sudo flatpak update -y && sudo flatpak uninstall --unused -y

echo -e "${VERDE}[INFO] - Instalando pacotes via Snap${SEM_COR}"

sudo apt install snapd -y
sudo snap install core

sudo sysctl kernel.unprivileged_userns_clone=1

sudo snap install hello-world
hello-world

#instalando programas
sudo snap install whatsie

#finalizacao
echo -e "${VERDE}[INFO] - Script finalizado, instalacao concluida! :)${SEM_COR}"
