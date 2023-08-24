#!/bin/bash

#update repository settings to allow for flatpak download
sudo add-apt-repository universe

#update the rep search after added setting
sudo apt update

echo "--APT INSTALL FROM CANONICAL SUPPORTED PACKAGES--" 
packages=("vim" "default-jdk" "default-jre" "gcc" "logisim" "git")
for pkg in "${packages[@]}"; do
    echo "-Installing $pkg..."
    sudo apt install "$pkg"
done

#setting up flatpak
echo "--APT INSTALL FOR FLATPAK SUPPORT AND STORE--"
sudo apt install -y flatpak gnome-software gnome-software-plugin-flatpak

echo "--ADDING FLATHUB SUPPORT FROM GITHUB REPO--"
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo #adds flathub, for more community-based packages

#snap installs
#code (vscode) is not on strict mode, and as such a prompt asks you to confirm. That's why it will be removed from here
echo "--INSTALLING FROM SNAP--" 
packages=("discord" "drawio")
for pkg in "${packages[@]}"; do
    echo "-Installing $pkg..."
    sudo snap install "$pkg"
done

#flak installs - giving errors
echo "--INSTALLING FROM FLATPAK--"
flakLinks=("app/com.github.IsmaelMartinez.teams_for_linux/x86_64/stable" #teams
"io.github.shiftey.Desktop/x86_64/stable" #github
)
for pkg in "${flakLinks[@]}"; do
    echo "-Installing $pkg..."
    install " flatpack install $pkg"
done

