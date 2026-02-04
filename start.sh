#!/bin/bash

SERVER_DIR="$(dirname "$0")/server"
SERVER_JAR="$SERVER_DIR/server.jar"

if [ ! -f "$SERVER_JAR" ]; then
  echo "❌ server.jar not found!"
  echo "Run install.sh first."
  exit 1
fi

echo "=============================="
echo " GitCraft Server Launcher"
echo " Minecraft Java Edition 1.21"
echo "=============================="
echo
echo "Select RAM size (2–16 GB)"
echo

while true; do
  read -p "Enter RAM size in GB: " RAM
  if [[ "$RAM" =~ ^[0-9]+$ ]] && [ "$RAM" -ge 2 ] && [ "$RAM" -le 16 ]; then
    break
  else
    echo "❌ Invalid input. Enter a value between 2 and 16."
  fi
done

cd "$SERVER_DIR"
java -Xms"${RAM}G" -Xmx"${RAM}G" -jar server.jar nogui
