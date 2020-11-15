#!/bin/bash

# Exit on error
set -e

###########################
# Browsers
###########################

# Chromium
if pgrep 'chrome'
then
  killall chrome
fi
if sudo snap list | grep 'chromium'
then
  sudo snap remove --purge 'chromium'
fi

# Firefox
if pgrep 'firefox'
then
  killall firefox
fi
if dpkg --get-selections | grep 'firefox'
then
  sudo apt autoremove -y --purge  'firefox'
fi
if test -d ~/.mozilla
then
  rm -rf ~/.mozilla
fi

###########################
# Messaging client
###########################

# Thunderbird
if pgrep 'thunderbird'
then
  killall thunderbird
fi
if ls -l /etc/apt/sources.list.d/ubuntu-mozilla-daily-ubuntu-ppa* 2> /dev/null
then
  sudo rm -f /etc/apt/sources.list.d/ubuntu-mozilla-daily-ubuntu-ppa*
fi
if dpkg --get-selections | grep 'thunderbird'
then
  sudo apt autoremove -y --purge 'thunderbird'
fi
if test -d ~/.thunderbird
then
  rm -rf ~/.thunderbird
fi

###########################
# Password manager
###########################

# Bitwarden
if pgrep 'bitwarden'
then
  killall bitwarden
fi
if sudo snap list | grep 'bitwarden'
then
  sudo snap remove --purge 'bitwarden'
fi

###########################
# Document publishing
###########################

# LibreOffce
if pgrep 'soffice.bin'
then
  killall soffice.bin
fi
if sudo snap list | grep 'libreoffice'
then
  sudo snap remove --purge 'libreoffice'
fi

# Scribus
if pgrep 'scribus'
then
  killall scribus
fi
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
if pgrep 'java'
then
  killall java
fi
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
if ls -l ~/.gnome/apps/install4j* 2> /dev/null
then
  rm -f ~/.gnome/apps/install4j*
fi

# VLC
if pgrep 'vlc'
then
  killall vlc
fi
if sudo snap list | grep 'vlc'
then
  sudo snap remove --purge 'vlc'
fi

###########################
# Image editing
###########################

# Krita
if pgrep 'krita'
then
  killall krita
fi
if sudo snap list | grep 'krita'
then
  sudo snap remove --purge 'krita'
fi

# Inkscape
if pgrep 'inkscape'
then
  killall inkscape
fi
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
if pgrep 'openshot-qt'
then
  killall openshot-qt
fi
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
if pgrep 'ghb'
then
  killall ghb
fi
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
if pgrep 'obs'
then
  killall obs
fi
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
if pgrep 'code'
then
  killall code
fi
if ls -l /etc/apt/sources.list.d/vscode* 2> /dev/null
then
  sudo rm -f /etc/apt/sources.list.d/vscode*
fi
if dpkg --get-selections | grep "^code"
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
if pgrep 'filezilla'
then
  killall filezilla
fi
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
if pgrep 'docker'
then
  sudo pkill docker
fi
if sudo snap list | grep 'docker'
then
  sudo snap remove --purge 'docker'
fi
if groups "$USER" | grep 'docker'
then
  sudo gpasswd -d "$USER" docker
fi
if cat /etc/group | grep 'docker'
then
  sudo groupdel 'docker'
fi

###########################
# Database viewers
###########################

# DBeaver
if pgrep 'java'
then
  killall java
fi
if sudo snap list | grep 'dbeaver-ce'
then
  sudo snap remove --purge 'dbeaver-ce'
fi

# Robot 3T
if pgrep 'robo3t'
then
  killall robo3t
fi
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
if test -d ~/.npm
then
  rm -rf ~/.npm
fi
if test -d ~/v8-compile-cache-0
then
  sudo rm -rf ~/v8-compile-cache-0
fi

###########################
# Terminal
###########################

# Set default shell to bash
if ! grep "^${USER}" /etc/passwd | grep '/bin/bash'
then
  chsh -s /bin/bash
fi

# Oh My Zsh
if test -f ~/.shell.pre-oh-my-zsh
then
  rm -f ~/.shell.pre-oh-my-zsh
fi
if test -d ~/.oh-my-zsh
then
  echo 'y' | sh ~/.oh-my-zsh/tools/uninstall.sh
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
# Miscellaneous
###########################

# Gnome
if test -d ~/.gnome
then
  rm -rf ~/.gnome
fi

# Gnupg
if test -d ~/.gnupg
then
  rm -rf ~/.gnupg
fi

# Gphoto
if test -d ~/.gphoto
then
  rm -rf ~/.gphoto
fi

# Pki
if test -d ~/.pki
then
  rm -rf ~/.pki
fi

# Swt
if test -d ~/.swt
then
  rm -rf ~/.swt
fi

# Wget
if test -d ~/.wget-hsts
then
  rm -rf ~/.wget-hsts
fi

