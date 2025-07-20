#!/bin/bash

source .env

PACKAGE="sunshine-${DISTRO}-${VERSION}-${ARCHITECTURE}.deb"

function updateSystem(){
  sudo apt-get update
}

function installDependencies(){
  sudo apt-get install -y wget curl
}

function downloadSunshine(){
  wget https://github.com/LizardByte/Sunshine/releases/latest/download/${PACKAGE}
}

function installSunshine(){
  sudo dpkg -i ./${PACKAGE}
}

function installMissingDependencies(){
  sudo apt-get install -f -y
}

function removeSunshineInstallation(){
  rm -f ./${PACKAGE}
}

updateSystem
installDependencies
downloadSunshine
installSunshine
installMissingDependencies
removeSunshineInstallation