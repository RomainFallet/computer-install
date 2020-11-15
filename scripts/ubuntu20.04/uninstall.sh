#!/bin/bash

# Exit on error
set -e

###########################
# Prerequisites
###########################

# Git
if dpkg --get-selections | grep 'git'
then
  sudo apt autoremove --purge -y 'git'
fi
if test -f ~/.gitconfig
then
  rm -f ~/.gitconfig
fi

###########################
# Terminal
###########################

# Oh My Zsh
if test -d ~/.oh-my-zsh
then
  echo 'y' | sh ~/.oh-my-zsh/tools/uninstall.sh
fi
if test -f ~/.shell.pre-oh-my-zsh
then
  rm -f ~/.shell.pre-oh-my-zsh
fi

# Set default shell to bash
if ! grep "^${USER}" /etc/passwd | grep '/bin/bash'
then
  chsh -s /bin/bash
fi

# Zsh
if dpkg --get-selections | grep 'zsh'
then
  sudo apt autoremove --purge -y zsh
fi
if ls ~/.zsh* 2> /dev/null
then
  rm -f ~/.zsh*
fi
if ls ~/.zcomp* 2> /dev/null
then
  rm -f ~/.zcomp*
fi

###########################
# Browsers
###########################

# Chromium
killall -q chrome
if sudo snap list | grep 'chromium'
then
  sudo snap remove --purge 'chromium'
fi

# Firefox
killall -q firefox
if dpkg --get-selections | grep 'firefox'
then
  sudo apt autoremove --purge  'firefox'
fi
if test -d ~/.mozilla
then
  rm -rf ~/.mozilla
fi

###########################
# Messaging client
###########################

# Thunderbird
killall -q thunderbird
if ls -l /etc/apt/sources.list.d/ubuntu-mozilla-daily-ubuntu-ppa* 2> /dev/null
then
  sudo rm -f /etc/apt/sources.list.d/ubuntu-mozilla-daily-ubuntu-ppa*
fi
if dpkg --get-selections | grep 'thunderbird'
then
  sudo apt autoremove --purge 'thunderbird'
fi
if test -d ~/.thunderbird
then
  rm -rf ~/.thunderbird
fi

###########################
# Password manager
###########################

# Bitwarden
killall -q bitwarden
if sudo snap list | grep 'bitwarden'
then
  sudo snap remove --purge 'bitwarden'
fi

###########################
# Document publishing
###########################

# LibreOffce
killall -q soffice.bin
if sudo snap list | grep 'libreoffice'
then
  sudo snap remove --purge 'libreoffice'
fi

# Scribus
killall -q scribus
if ls -l /etc/apt/sources.list.d/scribus-ubuntu-ppa* 2> /dev/null
then
  sudo rm -f /etc/apt/sources.list.d/scribus-ubuntu-ppa*
fi
if dpkg --get-selections | grep 'scribus'
then
  sudo apt autoremove --purge -y 'scribus'
fi
if test -d ~/.config/scribus
then
  rm -rf ~/.config/scribus
fi


###########################
# File viewers
###########################

# PDF Sudio
killall -q java
if test -f ~/PDFStudio_linux64.sh
then
  rm -f ~/PDFStudio_linux64.sh
fi
if ls -l ~/pdfstudio* 2> /dev/null
then
  rm -rf ~/pdfstudio*
fi
if ls -l ~/.pdfstudio* 2> /dev/null
then
  rm -rf ~/.pdfstudio*
fi
if test -d ~/.java
then
  rm -rf ~/.java
fi
if test -f ~/.install4j
then
  rm -f ~/.install4j
fi


# VLC
killall -q vlc
if sudo snap list | grep 'vlc'
then
  sudo snap remove --purge 'vlc'
fi

###########################
# Image editing
###########################

# Krita
killall krita
if sudo snap list | grep 'krita'
then
  sudo snap remove --purge 'krita'
fi

# Inkscape
killall inkscape
if sudo snap list | grep 'inkscape'
then
  sudo snap remove --purge 'inkscape'
fi
if test -d ~/.config/inkscape
then
  rm -rf ~/.config/inkscape
fi


###########################
# Video editing
###########################

# OpenShot Video Editor
killall -q openshot-qt
if ls -l /etc/apt/sources.list.d/openshot_developers-ubuntu-ppa* 2> /dev/null
then
  sudo rm -f /etc/apt/sources.list.d/openshot_developers-ubuntu-ppa*
fi
if dpkg --get-selections | grep 'openshot-qt'
then
  sudo apt autoremove --purge -y 'openshot-qt'
fi
if test -d ~/.openshot_qt
then
  rm -rf ~/.openshot_qt
fi

# Handbrake
killall ghb
if ls -l /etc/apt/sources.list.d/stebbins-ubuntu-handbrake-releases* 2> /dev/null
then
  sudo rm -f /etc/apt/sources.list.d/stebbins-ubuntu-handbrake-releases*
fi
if dpkg --get-selections | grep 'handbrake-gtk'
then
  sudo apt autoremove --purge -y 'handbrake-gtk'
fi
if test -d ~/.config/ghb
then
  rm -rf ~/.config/ghb
fi

###########################
# Screen sharing
###########################

# OBS Studio
killall -q obs
if ls -l /etc/apt/sources.list.d/obsproject-ubuntu-obs-studio* 2> /dev/null
then
  sudo rm -f /etc/apt/sources.list.d/obsproject-ubuntu-obs-studio*
fi
if dpkg --get-selections | grep 'obs-studio'
then
  sudo apt autoremove --purge -y 'obs-studio'
fi
if test -d ~/.config/obs-studio
then
  rm -rf ~/.config/obs-studio
fi

###########################
# Code editor
###########################

# VS Code
sudo pkill code
if ls -l /etc/apt/sources.list.d/vscode* 2> /dev/null
then
  sudo rm -f /etc/apt/sources.list.d/vscode*
fi
if dpkg --get-selections | grep "^code$"
then
  sudo apt autoremove --purge -y 'code'
fi
if dpkg --get-selections | grep "^code$"
then
  sudo apt autoremove --purge -y 'code'
fi
if dpkg --get-selections | grep 'fonts-firacode'
then
  sudo apt autoremove --purge -y fonts-firacode
fi
if test -d ~/.vscode
then
  rm -rf ~/.vscode
fi
if test -d ~/.config/Code
then
  rm -rf ~/.config/Code
fi
if test -d /usr/share/code
then
  sudo rm -rf /usr/share/code
fi

###########################
# FTP/SFTP client
###########################

# Filezilla
killall -q filezilla
if dpkg --get-selections | grep 'filezilla'
then
  sudo apt autoremove --purge -y 'filezilla'
fi
if test -d ~/.cache/filezilla
then
  rm -rf ~/.cache/filezilla
fi

###########################
# Containers/VMs tools
###########################

# Docker
sudo pkill docker
if sudo snap list | grep 'docker'
then
  sudo snap remove --purge 'docker'
fi
if groups "$USER" | grep 'docker'
then
  sudo gpasswd -d "$USER" docker
fi
if less /etc/group | grep 'docker'
then
  sudo groupdel 'docker'
fi

###########################
# Database viewers
###########################

# DBeaver
killall -q java
if sudo snap list | grep 'dbeaver-ce'
then
  sudo snap remove --purge 'dbeaver-ce'
fi

# Robot 3T
if sudo snap list | grep 'robo3t-snap'
then
  sudo snap remove --purge 'robo3t-snap'
fi

###########################
# Code programs
###########################

# Node
if sudo snap list | grep 'node'
then
  sudo snap remove --purge 'node'
fi
