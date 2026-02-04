#!/bin/bash

ROOT_DIR="$(dirname "$0")"
SERVER_DIR="$ROOT_DIR/server"
SERVER_JAR="$SERVER_DIR/server.jar"

# -------------------------------
# Auto Git Commit & Push
# -------------------------------
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "🔄 Syncing server data to Git..."

  git add -A

  if ! git diff --cached --quiet; then
    git commit -m "Auto backup: server data before start ($(date '+%Y-%m-%d %H:%M:%S'))"
    git push
    echo "✅ Server data pushed to Git"
  else
    echo "ℹ️ No changes to push"
  fi
else
  echo "⚠️ Not a Git repository. Skipping Git sync."
fi

echo
echo "=============================="
echo " GitCraft Server Launcher"
echo " Minecraft Java Edition 1.21"
echo "=============================="
echo

if [ ! -f "$SERVER_JAR" ]; then
  echo "❌ server.jar not found!"
  echo "Run setup.sh first."
  exit 1
fi

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

cd "$SERVER_DIR" || exit 1
java -Xms"${RAM}G" -Xmx"${RAM}G" -jar server.jar nogui
