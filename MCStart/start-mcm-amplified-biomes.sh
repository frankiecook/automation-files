#!/bin/bash
echo "Starting Minecraft Server"
cd MinecraftServers/amplified_biome_1.18.1
java -Xmx8192M -Xms2048M -jar paper-1.18.1-101.jar nogui
echo "I am done running"
