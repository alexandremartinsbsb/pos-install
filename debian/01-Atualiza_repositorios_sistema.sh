#!/usr/bin/env bash

echo -e "Iniciando script"

## CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

# escanear por drivers: sudo apt search nvidia-driver

echo -e "${VERDE}[INFO] - Atualizando repositorio do sistema${SEM_COR}"

sudo sh -c 'echo "deb http://ftp.br.debian.org/debian/ sid main contrib non-free non-free-firmware" > /etc/apt/sources.list'
echo "deb-src http://ftp.br.debian.org/debian/ sid main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security bookworm-security main non-free-firmware" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://security.debian.org/debian-security bookworm-security main non-free-firmware" | sudo tee -a /etc/apt/sources.list

#finalizacao
echo -e "${VERDE}[INFO] - Script finalizado, instalacao concluida! :)${SEM_COR}"
