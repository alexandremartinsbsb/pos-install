#!/usr/bin/env bash
echo "Iniciando script"
# ----------------------------- VARIÁVEIS ----------------------------- #

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_GITHUB_DESKTOP="https://github.com/shiftkey/desktop/releases/download/release-2.9.6-linux1/GitHubDesktop-linux-2.9.6-linux1.deb"
URL_TEAMVIEW="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
URL_ETCHER="https://github.com/balena-io/etcher/releases/download/v1.7.3/balena-etcher-electron_1.7.3_amd64.deb"
URL_COMPASS="https://downloads.mongodb.com/compass/mongodb-compass_1.30.1_amd64.deb"
URL_SKYPE="https://go.skype.com/skypeforlinux-64.deb"
#URL_DBEAVER="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
URL_SMARTGIT="https://www.syntevo.com/downloads/smartgit/smartgit-21_2_1.deb"

DIRETORIO_DOWNLOADS="./programas"

# ---------------------------------------------------------------------- #

## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Adicionando/Confirmando arquitetura de 32 bits ##
## sudo dpkg --add-architecture i386

## Atualização
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/*
sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y

## Dependencias
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
sudo apt install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev -y
sudo apt install g++ build-essential qt5-qmake qttools5-dev-tools -y
sudo apt install libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5-dev -y
sudo apt install gnome-themes-standard gtk2-engines-murrine libglib2.0-dev libxml2-utils -y
sudo apt install git openssl ca-certificates -y
sudo apt install curl -y
sudo apt install -y sassc
sudo apt install zip -y
sudo apt install unrar -y
sudo apt install wget -y
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['']"

## Atualização
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/*
sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y

## Driver video
sudo apt install nvidia-driver-390 -y

##Node & Npn
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt install -y nodejs

# ----------------------------- REQUISITOS ----------------------------- #

## Atualização
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/*
sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y

## Flameshot
sudo apt install flameshot -y

## Flatpak
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
sudo flatpak update -y

## Instalar Spotify
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 5E3C45D7B312C643
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update -y && sudo apt install spotify-client -y

## Instalar VLC
sudo apt install vlc -y

## Instalar o Git
sudo apt install git -y

# Instala Git Flow
sudo apt install git-flow -y

## Instalar o SSH(Git)
ssh-keygen -o
cat ~/.ssh/id_rsa.pub

## Instala o Java
sudo apt install openjdk-17-jdk -y
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin

## Instalando neofetch
sudo apt install neofetch -y
neofetch

# ----------------------------- EXECUÇÃO ----------------------------- #
## Atualização
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/*
sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y

## Download e instalaçao de programas externos ##
mkdir "${DIRETORIO_DOWNLOADS}"
wget -c "${URL_GOOGLE_CHROME}"   -P "${DIRETORIO_DOWNLOADS}"
wget -c "${URL_GITHUB_DESKTOP}"  -P "${DIRETORIO_DOWNLOADS}"
wget -c "${URL_TEAMVIEW}"        -P "${DIRETORIO_DOWNLOADS}"
wget -c "${URL_ETCHER}"          -P "${DIRETORIO_DOWNLOADS}"
wget -c "${URL_COMPASS}"         -P "${DIRETORIO_DOWNLOADS}"
wget -c "${URL_SKYPE}"           -P "${DIRETORIO_DOWNLOADS}"
wget -c "${URL_DBEAVER}"         -P "${DIRETORIO_DOWNLOADS}"
wget -c "${URL_SMARTGIT}"        -P "${DIRETORIO_DOWNLOADS}"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg --force-depends -i ${DIRETORIO_DOWNLOADS}/*.deb

## Instalando pacotes Flatpak ##
sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y
sudo flatpak install flathub com.github.muriloventuroso.easyssh -y
sudo flatpak install flathub org.gnome.meld -y
#sudo flatpak install flathub com.syntevo.SmartGit -y
sudo flatpak install flathub org.gabmus.hydrapaper -y
sudo flatpak install flathub org.telegram.desktop -y
sudo flatpak install flathub com.slack.Slack -y
sudo flatpak install flathub com.jetbrains.IntelliJ-IDEA-Ultimate -y
sudo flatpak install flathub com.sublimetext.three -y
sudo flatpak install flathub com.getpostman.Postman -y
#sudo flatpak install flathub com.spotify.Client -y
sudo flatpak install flathub org.eclipse.Java -y
sudo flatpak install flathub com.google.AndroidStudio -y
sudo flatpak install flathub io.bit3.WhatsAppQT -y

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo rm -rf "$DIRETORIO_DOWNLOADS"
sudo apt -f install -y
sudo apt update
sudo flatpak update -y

## Atualização
sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /var/lib/apt/lists/partial/*
sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y sudo flatpak repair && sudo flatpak update -y && sudo flatpak uninstall --unused -y && appstreamcli refresh --force
# ---------------------------------------------------------------------- #
echo "Script Finalizado"
