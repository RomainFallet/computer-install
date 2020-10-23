#!/bin/bash

# Exit on error
set -e

# Update packages list
sudo apt update

###########################
# Remove existing apps
###########################

# Firefox
if dpkg --get-selections | grep 'firefox'
then
  sudo apt autoremove --purge -y firefox firefox-locale-en firefox-locale-fr
fi
if test -d ~/.mozilla
then
  sudo rm -rf ~/.mozilla
fi
if test -d ~/.cache/mozilla
then
  sudo rm -rf ~/.cache/mozilla
fi

###########################
# Prerequisites
###########################

# Git
if ! dpkg --get-selections | grep 'git'
then
  sudo apt install -y git
fi

###########################
# Terminal
###########################

# Zsh
if ! dpkg --get-selections | grep 'zsh'
then
  sudo apt install -y zsh
fi

# Oh My Zsh
if ! test -d ~/.oh-my-zsh
then
  sh -c "$(wget --no-cache -O- https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

###########################
# Browsers
###########################

# Chromium
if ! sudo snap list | grep 'chromium'
then
  sudo snap install 'chromium'
fi

# Firefox
if ! sudo snap list | grep 'firefox'
then
  sudo snap install 'firefox'
fi

###########################
# Messaging client
###########################

# Thunderbird
if ! sudo snap list | grep 'thunderbird'
then
  sudo snap install 'thunderbird'
fi

###########################
# Password manager
###########################

# Bitwarden
if ! sudo snap list | grep 'bitwarden'
then
  sudo snap install 'bitwarden'
fi

###########################
# Document publishing
###########################

# LibreOffce
if ! sudo snap list | grep 'libreoffice'
then
  sudo snap install 'libreoffice'
fi

# Scribus
if ! ls -l /etc/apt/sources.list.d/scribus-ubuntu-ppa* 2> /dev/null
then
  sudo add-apt-repository -y ppa:scribus/ppa
  sudo apt update
fi
if ! dpkg --get-selections | grep 'scribus'
then
  sudo apt install -y 'scribus'
fi

###########################
# File viewers
###########################

# PDF Sudio
if ! test -f ~/PDFStudio_linux64.sh
then
  wget --no-cache -O ~/PDFStudio_linux64.sh https://download.qoppa.com/pdfstudio/PDFStudio_linux64.sh
fi
if ! ls -l ~/pdfstudio* 2> /dev/null
then
  sh ~/PDFStudio_linux64.sh
fi

# VLC
if ! sudo snap list | grep 'vlc'
then
  sudo snap install 'vlc'
fi

###########################
# Image editing
###########################

# Krita
if ! sudo snap list | grep 'krita'
then
  sudo snap install 'krita'
fi

# Inkscape
if ! sudo snap list | grep 'inkscape'
then
  sudo snap install 'inkscape'
fi

###########################
# Video editing
###########################

# OpenShot Video Editor
if ! ls -l /etc/apt/sources.list.d/openshot_developers-ubuntu-ppa* 2> /dev/null
then
  sudo add-apt-repository -y ppa:openshot.developers/ppa
  sudo apt update
fi
if ! dpkg --get-selections | grep 'openshot-qt'
then
  sudo apt install -y 'openshot-qt'
fi

# Handbrake
if ! ls -l /etc/apt/sources.list.d/stebbins-ubuntu-handbrake-releases* 2> /dev/null
then
  sudo add-apt-repository -y ppa:stebbins/handbrake-releases
  sudo apt update
fi
if ! dpkg --get-selections | grep 'handbrake-gtk'
then
  sudo apt install -y 'handbrake-gtk'
fi

###########################
# Screen sharing
###########################

# OBS Studio
if ! ls -l /etc/apt/sources.list.d/obsproject-ubuntu-obs-studio* 2> /dev/null
then
  sudo add-apt-repository -y ppa:obsproject/obs-studio
  sudo apt update
fi
if ! dpkg --get-selections | grep 'obs-studio'
then
  sudo apt install -y 'obs-studio'
fi

###########################
# Code editor
###########################

# VS Code
if ! sudo snap list | grep 'code'
then
  sudo snap install 'code' --classic
fi

###########################
# FTP/SFTP client
###########################

# Filezilla
if ! dpkg --get-selections | grep 'filezilla'
then
  sudo apt install -y 'filezilla'
fi

###########################
# Containers/VMs tools
###########################

# Docker
if ! sudo snap list | grep 'docker'
then
  sudo snap install 'docker'
fi
if ! less /etc/group | grep 'docker'
then
  sudo groupadd 'docker'
fi
if ! groups "$USER" | grep 'docker'
then
  sudo usermod -aG docker "$USER"
fi

###########################
# Database viewers
###########################

# DBeaver
if ! sudo snap list | grep 'dbeaver-ce'
then
  sudo snap install 'dbeaver-ce'
fi

# Robot 3T
if ! sudo snap list | grep 'robo3t-snap'
then
  sudo snap install 'robo3t-snap'
fi

###########################
# Code programs
###########################

# Node
nodejsaliasconfig='alias node="docker run -it --rm -v $(pwd):/tmp -w /tmp bitnami/node:12 node"'
if ! grep "${nodejsaliasconfig}" ~/.zshrc
then
  echo "${nodejsaliasconfig}" | tee -a ~/.zshrc > /dev/null
fi

# NPM
npmaliasconfig='alias npm="docker run -it --rm -v $(pwd):/tmp -w /tmp bitnami/node:12 npm"'
if ! grep "${npmaliasconfig}" ~/.zshrc
then
  echo "${npmaliasconfig}" | tee -a ~/.zshrc > /dev/null
fi

# Yarn
yarnaliasconfig='alias yarn="docker run -it --rm -v $(pwd):/tmp -w /tmp bitnami/node:12 yarn"'
if ! grep "${yarnaliasconfig}" ~/.zshrc
then
  echo "${yarnaliasconfig}" | tee -a ~/.zshrc > /dev/null
fi

