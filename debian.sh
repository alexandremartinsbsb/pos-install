#!/usr/bin/env bash
echo "Iniciando script"
# ----------------------------- VARIÁVEIS ----------------------------- #

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_GITHUB_DESKTOP="https://github.com/shiftkey/desktop/releases/download/release-2.5.3-linux1/GitHubDesktop-linux-2.5.3-linux1.deb"
URL_TEAMVIEW="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"

DIRETORIO_DOWNLOADS="/home/$USER/Downloads/programas"

# ---------------------------------------------------------------------- #

sudo sh -c 'echo "deb http://ftp.br.debian.org/debian buster main contrib non-free" > /etc/apt/sources.list'
echo "deb-src http://ftp.br.debian.org/debian buster main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb http://security.debian.org/ buster/updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://security.debian.org/ buster/updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb http://ftp.br.debian.org/debian/ buster-updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://ftp.br.debian.org/debian/ buster-updates main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb http://http.debian.net/debian/ buster-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list

## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y

## Dependencias
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
sudo apt-get install sudo apt-get install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev -y
sudo apt install g++ build-essential qt5-default qt5-qmake qttools5-dev-tools -y
sudo apt install libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5-dev -y
sudo apt install git openssl ca-certificates -y
sudo apt install curl

## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y

##Node & Npn
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

## Driver
sudo apt install nvidia-legacy-390xx-driver -y

## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y

# ----------------------------- REQUISITOS ----------------------------- #
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Adicionando/Confirmando arquitetura de 32 bits ##
sudo dpkg --add-architecture i386

## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y

## Etcher
sudo apt-get install balena-etcher-electron -y

## Gdebi
sudo apt install gdebi -y

## Flameshot
sudo apt install flameshot -y

## Snap
sudo apt install snapd -y
snap install hello-world
hello-world

## Flatpak
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y

## Instalar o Git
sudo apt install git -y

## Instalar o SSH(Git)
ssh-keygen -o
cat ~/.ssh/id_rsa.pub

## Instala o Java
sudo apt install default-jdk -y

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

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg --force-depends -i $DIRETORIO_DOWNLOADS/*.deb

## Instalando pacotes Flatpak ##
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub io.dbeaver.DBeaverCommunity -y
flatpak install flathub com.github.muriloventuroso.easyssh -y
flatpak install flathub org.gnome.meld -y
flatpak install flathub com.syntevo.SmartGit -y
flatpak install flathub com.syntevo.SmartSynchronize -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub org.gabmus.hydrapaper -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub com.gigitux.gtkwhats -y
flatpak install flathub com.skype.Client -y
flatpak install flathub com.slack.Slack -y
flatpak install flathub com.visualstudio.code -y
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community -y
flatpak install flathub com.sublimetext.three -y
flatpak install flathub com.getpostman.Postman -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub org.eclipse.Java -y
flatpak install flathub com.axosoft.GitKraken -y
flatpak install flathub com.microsoft.Teams -y
flatpak install flathub com.google.AndroidStudio -y

## Instalando pacotes Snap ##
sudo snap install robo3t-snap
sudo snap install photogimp
sudo snap install flutter --classic

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo rm -rf "$DIRETORIO_DOWNLOADS"
sudo rm -rf /var/cache/snapd
sudo rm -rf ~/snap
sudo apt-get -f install -y
sudo apt update
flatpak update

## Atualização
sudo apt update
sudo apt list --upgradable -a
sudo apt full-upgrade -y
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
echo "Script Finalizado"
