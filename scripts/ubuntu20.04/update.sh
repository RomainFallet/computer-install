#!/bin/bash

# Exit on error
set -e

# Update packages list
sudo apt update

###########################
# Apt updates
###########################

sudo apt upgrade --autoremove -y

###########################
# Snap updates
###########################

sudo snap refresh

###########################
# Terminal
###########################

# Oh My Zsh
sh ~/.oh-my-zsh/tools/upgrade.sh

