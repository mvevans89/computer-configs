#!/bin/bash

#install nvidia drivers ------
#list drivers, install, and reboot
# ubuntu-drivers devices
# sudo apt nvidia-driver-XXX
# reboot
# for boot troubleshooting, add nomodeset to the kernel

# install software applications via apt --------------
sudo apt-get update -y
sudo apt upgrade -y
#basic apps
sudo apt install curl -y
sudo apt install git-all -y
sudo apt install htop tmux -y
sudo apt install okular -y
sudo apt install lm-sensors -y
sudo apt install gfortran -y


sudo add-apt-repository universe
sudo apt install gnome-tweaks

sudo add-apt-repository ppa:libreoffice/ppa
sudo apt update && sudo apt install libreoffice

#spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

#r
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/r-project.gpg
echo "deb [signed-by=/usr/share/keyrings/r-project.gpg] https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" | sudo tee -a /etc/apt/sources.list.d/r-project.list
sudo apt update
sudo apt install --no-install-recommends r-base
cd Downloads
#rstudio
wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2023.03.0-386-amd64.deb
sudo apt install -f ./rstudio-2023.03.0-386-amd64.deb

#Sublime text editor
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install sublime-text

#VScode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

#QGIS installation
sudo apt install gnupg software-properties-common  -y
sudo wget -O /etc/apt/keyrings/qgis-archive-keyring.gpg https://download.qgis.org/downloads/qgis-archive-keyring.gpg
sudo nano /etc/apt/sources.list.d/qgis.sources
# Types: deb deb-src
# URIs: https://qgis.org/debian
# Suites: jammy
# Architectures: amd64
# Components: main
# Signed-By: /etc/apt/keyrings/qgis-archive-keyring.gpg
sudo apt update
sudo apt install qgis qgis-plugin-grass -y

#install latex
sudo apt install texlive
sudo apt install latexmk

#gimp
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt update
sudo apt install gimp


# snap packages ------------
sudo snap install slack
sudo snap install vlc
sudo snap install skype
sudo snap install julia --clasic

#dropbox is downloaded manually
# download from here: https://www.dropbox.com/install-linux
cd Downloads
sudo dpkg -i dropbox_2020.03.04_amd64.deb

#chrome must be installed manually
#download from here: 

# zotero
wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash
sudo apt update
sudo apt install zotero
#add symlink for pdf
rm /home/mevans/Zotero/storage
ln -s /home/mevans/Dropbox/Zotero/storage /home/mevans/Zotero


#update gnome appearance --------------
# remove things from sidebar by commenting them out
# ~/.config/user-dirs.dirs
# add enabled=false to ~/.config/user-dirs.conf
gsettings set org.gnome.nautilus.list-view default-zoom-level 'small'
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'standard'
