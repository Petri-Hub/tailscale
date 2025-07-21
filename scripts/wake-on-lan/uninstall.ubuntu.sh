#!/bin/bash

source .env

SERVICE_NAME="wol.service"
SERVICE_PATH="/etc/systemd/system/$SERVICE_NAME"

stopAndDisableWakeOnLanService(){
  sudo systemctl stop "$SERVICE_NAME"
  sudo systemctl disable "$SERVICE_NAME"
}

removeWakeOnLanForFutureSessions(){
  sudo rm "$SERVICE_PATH"
}

disableWakeOnLanForCurrentSession(){
  sudo ethtool -s $NETWORK_INTERFACE wol d
}

reloadSystemdDaemon(){
  sudo systemctl daemon-reload
}

removeWakeOnLanCLI(){
  sudo apt-get remove -y wakeonlan
}

stopAndDisableWakeOnLanService
removeWakeOnLanForFutureSessions
disableWakeOnLanForCurrentSession
reloadSystemdDaemon
removeWakeOnLanCLI