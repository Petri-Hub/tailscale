#!/bin/bash

source .env

PACKAGE="sunshine-${DISTRO}-${DISTRO_VERSION}-${SYSTEM_ARCHITECTURE}.deb"
SERVICE_NAME="sunshine.service"
SERVICE_PATH="/etc/systemd/user/$SERVICE_NAME"

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
  rm -f ./${PACKAGE}
}

setupSunshineStartup(){
  echo "
    [Unit]
    Description=Sunshine remote desktop streaming server
    After=graphical-session.target
    Wants=graphical-session.target

    [Service]
    Type=simple
    ExecStart=/usr/bin/sunshine
    Restart=always
    RestartSec=5

    [Install]
    WantedBy=default.target
  " > "$SERVICE_PATH"
}

setupServiceStartup(){
  sudo loginctl enable-linger $USER
  sudo systemctl daemon-reload

  systemctl --user daemon-reload
  systemctl --user enable sunshine
}

startSunshine(){
  systemctl --user start sunshine
}

updateSystem
installDependencies
downloadSunshine
installSunshine
installMissingDependencies
removeSunshineInstallation
setupSunshineStartup
setupServiceStartup
startSunshine