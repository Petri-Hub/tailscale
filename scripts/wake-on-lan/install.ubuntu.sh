#!/bin/bash

source .env

SERVICE_NAME="wol.service"
SERVICE_PATH="/etc/systemd/system/$SERVICE_NAME"

installWakeOnLanCLI(){
  sudo apt update
  sudo apt install -y wakeonlan
}

setupWakeOnLanForFutureSessions(){
  echo "
    [Unit]
    Description=Enable Wake-on-LAN on interface '$NETWORK_INTERFACE'
    After=network-online.target

    [Service]
    Type=oneshot
    ExecStart=/usr/sbin/ethtool -s $NETWORK_INTERFACE wol g

    [Install]
    WantedBy=multi-user.target
  " > "$SERVICE_PATH"
}

setupServiceStartup(){
  sudo systemctl daemon-reload
  sudo systemctl enable "$SERVICE_NAME"
  sudo systemctl start "$SERVICE_NAME"
}

installWakeOnLanCLI
setupWakeOnLanForFutureSessions
setupServiceStartup