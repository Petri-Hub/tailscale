#!/bin/bash

source .env

PACKAGE="sunshine-${DISTRO}-${VERSION}-${ARCHITECTURE}.deb"

updateSystem(){
  sudo apt-get update
}

installDependencies(){
  sudo apt-get install -y wget curl
}

downloadSunshine(){
  wget https://github.com/LizardByte/Sunshine/releases/latest/download/${PACKAGE}
}

installSunshine(){
  sudo dpkg -i ./${PACKAGE}
}

installMissingDependencies(){
  sudo apt-get install -f -y
}

removeSunshineInstallation(){
  rm -f .S/${PACKAGE}
}

startSunshine(){
  systemctl --user start sunshine
}

setupSunshineStartup(){
  systemctl --user enable sunshine
}

updateSystem
installDependencies
downloadSunshine
installSunshine
installMissingDependencies
removeSunshineInstallation
setupSunshineStartup
startSunshine