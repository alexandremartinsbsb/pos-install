#!/usr/bin/env bash

echo -e "Iniciando script"

## CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

echo -e "${VERDE}[INFO] - Testando se esta OK a internet${SEM_COR}"

if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
    echo -e "${VERMELHO}[ERROR] - O computador nao tem conexao com a internet. Verificar a situacao da rede.${SEM_COR}"
    exit 1
else
    echo -e "${VERDE}[INFO] - Conexao com a internet funcionando normalmente.${SEM_COR}"
fi

#finalizacao
echo -e "${VERDE}[INFO] - Script finalizado, instalacao concluida! :)${SEM_COR}"
