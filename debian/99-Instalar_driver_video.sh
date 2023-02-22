#!/usr/bin/env bash

echo -e "Iniciando script"

## CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

# escanear por drivers: sudo apt search nvidia-driver

echo -e "${VERDE}[INFO] - Atualizando o sistema${SEM_COR}"
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/* && sudo rm -f /var/lib/dpkg/lock && sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y sudo flatpak repair && sudo flatpak update -y && sudo flatpak uninstall --unused -y

echo -e "${VERDE}[INFO] - Instalando driver${SEM_COR}"
sudo apt install nvidia-legacy-390xx-driver -y

#finalizacao
echo -e "${VERDE}[INFO] - Script finalizado, instalacao concluida! :)${SEM_COR}"
