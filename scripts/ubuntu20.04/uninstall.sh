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

###########################
# Terminal
###########################

# Oh My Zsh
if test -d ~/.oh-my-zsh
then
  echo 'y' | sh ~/.oh-my-zsh/tools/uninstall.sh
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
if sudo snap list | grep 'chromium'
then
  sudo snap remove --purge 'chromium'
fi

# Firefox
if sudo snap list | grep 'firefox'
then
  sudo snap remove --purge 'firefox'
fi
if test -d ~/Téléchargements/firefox.tmp
then
  rm -rf ~/Téléchargements/firefox.tmp
fi

###########################
# Messaging client
###########################

# Thunderbird
if sudo snap list | grep 'thunderbird'
then
  sudo snap remove --purge 'thunderbird'
fi
if test -d ~/Téléchargements/thunderbird.tmp
then
  rm -rf ~/Téléchargements/thunderbird.tmp
fi

###########################
# Password manager
###########################

# Bitwarden
if sudo snap list | grep 'bitwarden'
then
  sudo snap remove --purge 'bitwarden'
fi

###########################
# Document publishing
###########################

# LibreOffce
if sudo snap list | grep 'libreoffice'
then
  sudo snap remove --purge 'libreoffice'
fi

# Scribus
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
if sudo snap list | grep 'vlc'
then
  sudo snap remove --purge 'vlc'
fi

###########################
# Image editing
###########################

# Krita
if sudo snap list | grep 'krita'
then
  sudo snap remove --purge 'krita'
fi

# Inkscape
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
if sudo snap list | grep 'code'
then
  sudo snap remove --purge 'code'
fi
if test -d ~/.vscode
then
  rm -rf ~/.vscode
fi
if test -d ~/.config/Code
then
  rm -rf ~/.config/Code
fi

###########################
# FTP/SFTP client
###########################

# Filezilla
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
if sudo snap list | grep 'dbeaver-ce'
then
  sudo snap remove --purge 'dbeaver-ce'
fi

# Robot 3T
if sudo snap list | grep 'robo3t-snap'
then
  sudo snap remove --purge 'robo3t-snap'
fi
