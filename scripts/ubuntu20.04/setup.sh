#!/bin/bash

# Exit on error
set -e

# Update packages list
sudo apt update

###########################
# Prerequisites
###########################

# Git
if ! dpkg --get-selections | grep 'git'
then
  sudo apt install -y git
fi

###########################
# Clone repository
###########################

if ! test -d ~/computer-install
then
  git clone https://github.com/RomainFallet/computer-install.git ~/computer-install
fi