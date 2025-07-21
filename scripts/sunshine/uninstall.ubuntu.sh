#!/bin/bash

SERVICE_NAME="sunshine.service"
SERVICE_PATH="/etc/systemd/user/$SERVICE_NAME"

stopAndDisableSunshineService(){
  systemctl --user stop sunshine 2>/dev/null || true
  systemctl --user disable sunshine 2>/dev/null || true
}

removeSunshineService(){
  sudo rm -f "$SERVICE_PATH"
}

reloadSystemdDaemon(){
  sudo systemctl daemon-reload
  systemctl --user daemon-reload
}

uninstallSunshine() {
  sudo apt-get remove -y sunshine
}

stopAndDisableSunshineService
removeSunshineService
reloadSystemdDaemon
uninstallSunshine