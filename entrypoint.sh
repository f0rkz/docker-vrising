#!/bin/bash
/steamcmd/steamcmd.sh +force_install_dir /root/.wine/drive_c/VRisingServer/ +login anonymous +app_update 1829350 validate +quit

mkdir -p /root/.wine/drive_c/VRisingServer/save
mkdir -p /root/.wine/drive_c/VRisingServer/logs

rm -r /tmp/.X0-lock
cd /root/.wine/drive_c/VRisingServer/
Xvfb :0 -screen 0 1024x768x16 & \
DISPLAY=:0.0 wine VRisingServer.exe -persistentDataPath /root/.wine/drive_c/VRisingServer/save -serverName "${SERVERNAME}" -saveName "world1" -logFile /root/.wine/drive_c/VRisingServer/logs/VRisingServer.log
