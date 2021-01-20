#!/usr/bin/env bash
echo "Iniciando script"
# ----------------------------- VARIÁVEIS ----------------------------- #

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_GITHUB_DESKTOP="https://github.com/shiftkey/desktop/releases/download/release-2.6.1-linux2/GitHubDesktop-linux-2.6.1-linux2.deb"
URL_TEAMVIEW="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
URL_ETCHER="https://github.com/balena-io/etcher/releases/download/v1.5.113/balena-etcher-electron_1.5.113_amd64.deb"
URL_VSCODE="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
URL_TEAMS="https://go.microsoft.com/fwlink/p/?LinkID=2112886&clcid=0x416&culture=pt-br&country=BR"
URL_COMPASS="https://downloads.mongodb.com/compass/mongodb-compass_1.24.6_amd64.deb"
URL_SKYPE="https://go.skype.com/skypeforlinux-64.deb"

DIRETORIO_DOWNLOADS="/home/$USER/Downloads/programas"

# ---------------------------------------------------------------------- #

## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Adicionando/Confirmando arquitetura de 32 bits ##
## sudo dpkg --add-architecture i386

sudo sh -c 'echo "deb http://ftp.br.debian.org/debian buster main contrib non-free" > /etc/apt/sources.list'
echo "deb-src http://deb.debian.org/debian/ buster main non-free contrib" | sudo tee -a /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security buster/updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://security.debian.org/debian-security buster/updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb http://deb.debian.org/debian/ buster-updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ buster-updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb http://deb.debian.org/debian/ buster-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ buster-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list

## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y

## Dependencias
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
sudo apt install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev -y
sudo apt install g++ build-essential qt5-default qt5-qmake qttools5-dev-tools -y
sudo apt install libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5-dev -y
sudo apt install gnome-themes-standard gtk2-engines-murrine libglib2.0-dev libxml2-utils -y
sudo apt install git openssl ca-certificates -y
sudo apt install curl -y
sudo apt install -y sassc
sudo apt install zip -y

## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y

##Node & Npn
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt install -y nodejs

## Driver
sudo apt install nvidia-legacy-390xx-driver -y

# ----------------------------- REQUISITOS ----------------------------- #

## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y

## Gdebi
sudo apt install gdebi -y

## Flameshot
sudo apt install flameshot -y

## Snap
sudo apt install snapd -y
sudo snap install hello-world

## Flatpak
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
sudo flatpak update -y

## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y

## Instalar o Git
sudo apt install git -y

# Instala Git Flow
sudo apt install git-flow

## Instalar o SSH(Git)
ssh-keygen -o
cat ~/.ssh/id_rsa.pub

## Instala o Java
sudo apt install openjdk-11-jdk -y
export JAVA_HOME=/usr/lib/jvm/openjdk-11-jdk
export PATH=$PATH:$JAVA_HOME/bin

# ----------------------------- EXECUÇÃO ----------------------------- #
## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y

## Download e instalaçao de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"   -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GITHUB_DESKTOP"  -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_TEAMVIEW"        -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_ETCHER"          -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_VSCODE"          -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_TEAMS"           -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_COMPASS"         -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_SKYPE"           -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg --force-depends -i $DIRETORIO_DOWNLOADS/*.deb

## Instalando pacotes Flatpak ##
sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y
sudo flatpak install flathub com.github.muriloventuroso.easyssh -y
sudo flatpak install flathub org.gnome.meld -y
sudo flatpak install flathub com.syntevo.SmartGit -y
sudo flatpak install flathub org.gabmus.hydrapaper -y

## Instalando pacotes Snap ##
sudo snap install photogimp
sudo snap install vlc
sudo snap install telegram-desktop
sudo snap install whatsdesk
sudo snap install slack --classic
sudo snap install intellij-idea-community --classic
sudo snap install sublime-text --classic
sudo snap install postman
sudo snap install spotify
sudo snap install eclipse --classic
sudo snap install android-studio --classic

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo rm -rf "$DIRETORIO_DOWNLOADS"
sudo rm -rf /var/cache/snapd
sudo rm -rf ~/snap
sudo apt -f install -y
sudo apt update
sudo flatpak update -y

## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
echo "Script Finalizado"
