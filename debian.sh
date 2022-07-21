#!/usr/bin/env bash

echo -e "Iniciando script"

# ----------------------------- VARIÁVEIS ----------------------------- #

## URLs
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_GITHUB_DESKTOP="https://github.com/shiftkey/desktop/releases/download/release-3.0.3-linux1/GitHubDesktop-linux-3.0.3-linux1.deb"
URL_TEAMVIEW="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
URL_ETCHER="https://github.com/balena-io/etcher/releases/download/v1.7.9/balena-etcher-electron_1.7.9_amd64.deb"
URL_COMPASS="https://downloads.mongodb.com/compass/mongodb-compass_1.32.3_amd64.deb"
URL_SKYPE="https://go.skype.com/skypeforlinux-64.deb"
URL_DBEAVER="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
URL_SMARTGIT="https://www.syntevo.com/downloads/smartgit/smartgit-21_2_3.deb"

## DIRETORIO E ARQUIVOS
DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

## CORES
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

## NOMES DE PROGRAMAS PARA INSTALAR
PROGRAMAS_PARA_INSTALAR=(
    nvidia-legacy-390xx-driver
    gdebi
    flameshot
    vlc
    git
    git-flow
    neofetch
    snapd
    core
)

# ----------------------------- FUNCOES -------------------------------- #

## Atualizando os repositorios do sistema
atualiza_repositorios_sistema(){
    echo -e "${VERDE}[INFO] - Atualizando repositorio do sistema${SEM_COR}"

    sudo sh -c 'echo "deb http://deb.debian.org/debian/ bullseye main non-free contrib" > /etc/apt/sources.list'
    echo "deb-src http://deb.debian.org/debian/ bullseye main non-free contrib" | sudo tee -a /etc/apt/sources.list
    echo "deb http://security.debian.org/debian-security bullseye-security main non-free contrib" | sudo tee -a /etc/apt/sources.list
    echo "deb-src http://security.debian.org/debian-security bullseye-security main non-free contrib" | sudo tee -a /etc/apt/sources.list
    echo "deb http://deb.debian.org/debian/ bullseye-updates main non-free contrib" | sudo tee -a /etc/apt/sources.list
    echo "deb-src http://deb.debian.org/debian/ bullseye-updates main non-free contrib" | sudo tee -a /etc/apt/sources.list
}

## ATUALIZA O REPOSITORIO E SISTEMA
atualiza(){
    echo -e "${VERDE}[INFO] - Atualizando o sistema${SEM_COR}"

    sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/* && sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y sudo flatpak repair && sudo flatpak update -y && sudo flatpak uninstall --unused -y
}

## Dependencias
adiciona_dependencias_e_extras(){    
    echo -e "${VERDE}[INFO] - Instalando dependencias${SEM_COR}"

    sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
    sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 5E3C45D7B312C643
    sudo apt install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev -y
    sudo apt install g++ build-essential qt5-qmake qttools5-dev-tools -y
    sudo apt install libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5-dev -y
    sudo apt install gnome-themes-standard gtk2-engines-murrine libglib2.0-dev libxml2-utils -y
    sudo apt install git openssl ca-certificates -y
    sudo apt install apt-transport-https -y
    sudo apt install wget gpg -y
    sudo apt install curl -y
    sudo apt install -y sassc
    sudo apt install zip -y
    sudo apt install unrar -y
    sudo apt install wget -y
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['']"
}

## INTERNET CONECTADO?
testa_internet(){
    echo -e "${VERDE}[INFO] - Testando se esta OK a internet${SEM_COR}"

    if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
        echo -e "${VERMELHO}[ERROR] - O computador nao tem conexao com a internet. Verificar a situacao da rede.${SEM_COR}"
        exit 1
    else
        echo -e "${VERDE}[INFO] - Conexao com a internet funcionando normalmente.${SEM_COR}"
    fi
}

## Removendo travas eventuais do apt(UBUNTU) ##
remove_travas_apt(){
    echo -e "${VERDE}[INFO] - Removendo travas do apt(ubuntu)${SEM_COR}"

    sudo rm /var/lib/dpkg/lock-frontend
    sudo rm /var/cache/apt/archives/lock
}

## Adicionando/Confirmando arquitetura de 32 bits ##
adiciona_suporte_arquitetura_32bits(){
    echo -e "${VERDE}[INFO] - Instalando suporte a arquitetura de 32bits${SEM_COR}"

    sudo dpkg --add-architecture i386
}

## Instala NodeJs, NPM e AngularCli
instala_node_npm_e_angularcli(){
    echo -e "${VERDE}[INFO] - Instalando NodeJs, Npm e AngulaCli${SEM_COR}"

    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt install -y nodejs
    sudo npm install -g @angular/cli -y
}

## Flatpak
instala_flatpak(){
    echo -e "${VERDE}[INFO] - Instalando Flatpak${SEM_COR}"

    sudo apt install flatpak -y
    sudo apt install gnome-software-plugin-flatpak -y
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    sudo flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
    sudo flatpak update -y
}

## Instalar Spotify
instala_spotify(){
    echo -e "${VERDE}[INFO] - Instalando Spotify${SEM_COR}"

    curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update -y && sudo apt-get install spotify-client -y
}

## Instalar o SSH(Git)
instala_ssh_git(){
    echo -e "${VERDE}[INFO] - Instalando SSH(Git)${SEM_COR}"

    ssh-keygen -o
    cat ~/.ssh/id_rsa.pub
}

## Instala o Java
instala_java17(){
    echo -e "${VERDE}[INFO] - Instalando JDK17${SEM_COR}"

    sudo apt install openjdk-17-jdk -y
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
    export PATH=$PATH:$JAVA_HOME/bin
}

## Baixar Intellij IDEA
baixa_intellij(){
    echo -e "${VERDE}[INFO] - Baixando Intellij IDEA${SEM_COR}"

    wget -c https://download.jetbrains.com/idea/ideaIU-2022.1.4.tar.gz?_ga=2.50087334.1486325822.1658323479-1411422535.1658117102&_gl=1*dz5zek*_ga*MTQxMTQyMjUzNS4xNjU4MTE3MTAy*_ga_9J976DJZ68*MTY1ODM2MjQyMC40LjEuMTY1ODM2MjQyNi41NA.. -P "/home/$USER/Documentos"
}

## Instala VScode
instala_vscode(){
    echo -e "${VERDE}[INFO] - Instalando VScode${SEM_COR}"


}

## Download e instalaçao de programas externos ##
baixa_instala_programas_debs(){
    echo -e "${VERDE}[INFO] - Baixando pacotes .deb${SEM_COR}"

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

    ## Instalando programas via apt
    echo -e "${VERDE}[INFO] - Instalando pacotes via apt do repositorio${SEM_COR}"

    for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
        if ! dpkg -l | grep -q $nome_do_programa; then # verifica se ja esta instalado
            sudo apt install "$nome_do_programa" -y
        else
            echo "[INSTALADO] - $nome_do_programa"
        fi
    done
}

## Instalando pacotes Flatpak ##
instala_flatpaks(){
    echo -e "${VERDE}[INFO] - Instalando pacotes via Flatpak${SEM_COR}"

    #sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y
    sudo flatpak install flathub com.github.muriloventuroso.easyssh -y
    sudo flatpak install flathub org.gnome.meld -y
    #sudo flatpak install flathub com.syntevo.SmartGit -y
    #sudo flatpak install flathub org.gabmus.hydrapaper -y
    sudo flatpak install flathub org.telegram.desktop -y
    sudo flatpak install flathub com.slack.Slack -y
    #sudo flatpak install flathub com.jetbrains.IntelliJ-IDEA-Ultimate -y
    sudo flatpak install flathub com.sublimetext.three -y
    sudo flatpak install flathub com.getpostman.Postman -y
    sudo flatpak install flathub com.spotify.Client -y
    #sudo flatpak install flathub org.eclipse.Java -y
    #sudo flatpak install flathub com.google.AndroidStudio -y
    sudo flatpak install flathub org.gimp.GIMP -y
}

## Instalando pacotes Snap ##
instala_snaps(){
    echo -e "${VERDE}[INFO] - Instalando pacotes via Snap${SEM_COR}"

    sudo snap install hello-world
    sudo snap install whatsdesk
    hello-world
}

# ----------------------------- POS-INSTALACAO ----------------------------- #
## Finalização, atualização e limpeza##
limpa_sistema(){
    sudo rm -rf "$DIRETORIO_DOWNLOADS"
    sudo apt -f install -y
}

# ----------------------------- EXECUCAO ----------------------------- #

remove_travas_apt
testa_internet
atualiza_repositorios_sistema
atualiza
adiciona_dependencias_e_extras
#adiciona_suporte_arquitetura_32bits
atualiza
instala_node_npm_e_angularcli
instala_flatpak
#instala_spotify
instala_ssh_git
instala_java17
baixa_intellij
instala_vscode
baixa_instala_programas_debs
instala_flatpaks
instala_snaps
limpa_sistema
atualiza

#finalizacao
echo -e "${VERDE}[INFO] - Script finalizado, instalacao concluida! :)${SEM_COR}"
