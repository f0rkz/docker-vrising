#!/bin/bash
/steamcmd/steamcmd.sh +force_install_dir /root/.wine/drive_c/VRisingServer/ +login anonymous +app_update 1829350 validate +quit

rm -r /tmp/.X0-lock
cd /root/.wine/drive_c/VRisingServer/
Xvfb :0 -screen 0 1024x768x16 & \
DISPLAY=:0.0 wine VRisingServer.exe