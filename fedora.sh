#!/usr/bin/env bash
echo "Iniciando script"
# ----------------------------- VARIAVEIS ----------------------------- #

#URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
URL_GITHUB_DESKTOP="https://github.com/shiftkey/desktop/releases/download/release-2.9.6-linux1/GitHubDesktop-linux-2.9.6-linux1.rpm"
#URL_TEAMVIEW="https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm"
URL_ETCHER="https://github.com/balena-io/etcher/releases/download/v1.7.3/balena-etcher-electron-1.7.3.x86_64.rpm"
#URL_COMPASS="https://downloads.mongodb.com/compass/mongodb-compass-1.28.4.x86_64.rpm"
URL_SKYPE="https://go.skype.com/skypeforlinux-64.rpm"

DIRETORIO_DOWNLOADS="./programas"

# ---------------------------------------------------------------------- #

## Atualização
sudo dnf upgrade --refresh -y && sudo dnf update -y && sudo dnf upgrade -y && sudo flatpak update -y && sudo dnf autoremove -y

## Dependencias
sudo dnf install git openssl ca-certificates -y
sudo dnf reinstall ca-certificates -y
sudo dnf install curl -y
sudo dnf install sassc -y
sudo dnf install zip -y
sudo dnf install wget -y
sudo dnf install gcc-c++ make -y
sudo dnf install liberation-fonts -y
sudo dnf install minizip-compat -y
sudo dnf install GConf2 -y
sudo dnf install lsb-core-noarch -y
sudo dnf install libatomic -y
sudo dnf install libatomic1 -y
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['']"

## Atualização
sudo dnf upgrade --refresh -y && sudo dnf update -y && sudo dnf upgrade -y && sudo flatpak update -y && sudo dnf autoremove -y

##Node & Npn
curl -fsSL https://rpm.nodesource.com/setup_17.x | sudo bash -
sudo dnf install nodejs -y

# ----------------------------- REQUISITOS ----------------------------- #

## Atualização
sudo dnf upgrade --refresh -y && sudo dnf update -y && sudo dnf upgrade -y && sudo flatpak update -y && sudo dnf autoremove -y

## Ajuste(tweak tool) ##
sudo dnf install gnome-tweak-tool -y

## Flameshot
sudo dnf install flameshot -y

## Instalar o Git
sudo dnf install git -y

# Instala Git Flow
sudo dnf copr enable elegos/gitflow -y
sudo dnf install gitflow -y

## Instalar o SSH(Git)
ssh-keygen -o
cat ~/.ssh/id_rsa.pub

## Instala o Java
sudo dnf install java-latest-openjdk -y
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-17.0.1.0.12-13.rolling.fc35.x86_64
export PATH=$PATH:$JAVA_HOME/bin

## Instalando neofetch
sudo dnf install neofetch -y
neofetch

# ----------------------------- EXECUÇÃO ----------------------------- #
## Atualização
sudo dnf upgrade --refresh -y && sudo dnf update -y && sudo dnf upgrade -y && sudo flatpak update -y && sudo dnf autoremove -y

## Download e instalaçao de programas externos ##
mkdir "${DIRETORIO_DOWNLOADS}"
#wget -c "${URL_GOOGLE_CHROME}"   -P "${DIRETORIO_DOWNLOADS}"
wget -c "${URL_GITHUB_DESKTOP}"  -P "${DIRETORIO_DOWNLOADS}"
#wget -c "${URL_TEAMVIEW}"        -P "${DIRETORIO_DOWNLOADS}"
wget -c "${URL_ETCHER}"          -P "${DIRETORIO_DOWNLOADS}"
#wget -c "${URL_COMPASS}"         -P "${DIRETORIO_DOWNLOADS}"
wget -c "${URL_SKYPE}"           -P "${DIRETORIO_DOWNLOADS}"

## Instalando pacotes .rpm baixados na sessão anterior ##
sudo dpkg --force-depends -i ${DIRETORIO_DOWNLOADS}/*.rpm

## Instalando pacotes Flatpak ##
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y
sudo flatpak install flathub com.github.muriloventuroso.easyssh -y
sudo flatpak install flathub org.gnome.meld -y
sudo flatpak install flathub com.syntevo.SmartGit -y
sudo flatpak install flathub org.gabmus.hydrapaper -y
sudo flatpak install flathub org.videolan.VLC -y
sudo flatpak install flathub org.telegram.desktop -y
sudo flatpak install flathub com.slack.Slack -y
sudo flatpak install flathub com.jetbrains.IntelliJ-IDEA-Ultimate -y
sudo flatpak install flathub com.sublimetext.three -y
sudo flatpak install flathub com.getpostman.Postman -y
sudo flatpak install flathub com.spotify.Client -y
sudo flatpak install flathub org.eclipse.Java -y
#sudo flatpak install flathub com.google.AndroidStudio -y
sudo flatpak install flathub io.bit3.WhatsAppQT -y

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo rm -rf "$DIRETORIO_DOWNLOADS"
sudo flatpak update -y

## Atualização
sudo dnf upgrade --refresh -y && sudo dnf update -y && sudo dnf upgrade -y && sudo flatpak update -y && sudo dnf autoremove -y
# ---------------------------------------------------------------------- #
echo "Script Finalizado"
