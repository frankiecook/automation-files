#!/bin/bash
# This script should only run when in multi-target mode (No GUI)

echo "starting screen sessions for multiple ssh sessions"
#screen -dm -S "Playit" ./startplayit.sh
screen -dm -S "MC Server" ./serverFrankie.sh
echo "Session has finished"
