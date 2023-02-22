#!/usr/bin/env bash

echo -e "Iniciando script"

## CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

echo -e "${VERDE}[INFO] - Atualizando o sistema${SEM_COR}"
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/* && sudo rm -f /var/lib/dpkg/lock && sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y sudo flatpak repair && sudo flatpak update -y && sudo flatpak uninstall --unused -y

## Instalando programas via apt
echo -e "${VERDE}[INFO] - Instalando pacotes via apt do repositorio${SEM_COR}"

## NOMES DE PROGRAMAS PARA INSTALAR
PROGRAMAS_PARA_INSTALAR=(
    gimp
    telegram.desktop
    easyssh
    meld
    gdebi
    vlc
    git-flow
    neofetch
)

for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
    if ! dpkg -l | grep -q $nome_do_programa; then # verifica se ja esta instalado
        sudo apt install "$nome_do_programa" -y
    else
        echo "[INSTALADO] - $nome_do_programa"
    fi
done

sudo apt -f install -y

#finalizacao
echo -e "${VERDE}[INFO] - Script finalizado, instalacao concluida! :)${SEM_COR}"
