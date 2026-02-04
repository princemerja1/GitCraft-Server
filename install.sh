#!/bin/bash

set -e

ROOT_DIR="$(pwd)"
SERVER_DIR="$ROOT_DIR/server"

echo "=============================="
echo " GitCraft Server Installer"
echo " Minecraft Java Edition 1.21"
echo "=============================="

# -------------------------------
# Create server directory
# -------------------------------
mkdir -p "$SERVER_DIR"

# -------------------------------
# Download PaperMC 1.21.8
# -------------------------------
echo "[1/10] Downloading PaperMC 1.21.8..."
wget -O "$SERVER_DIR/server.jar" \
"https://fill-data.papermc.io/v1/objects/8de7c52c3b02403503d16fac58003f1efef7dd7a0256786843927fa92ee57f1e/paper-1.21.8-60.jar"

# -------------------------------
# Download playit.gg
# -------------------------------
echo "[2/10] Downloading playit.gg..."
wget -O "$ROOT_DIR/playit" \
"https://github.com/princemerja1/GitCraft-Server/blob/8257611daae203423de7bdfb2ba447867625b7fc/playit"
chmod +x "$ROOT_DIR/playit"

# -------------------------------
# Fix Codespaces Yarn repo issue
# -------------------------------
echo "[3/10] Fixing broken Yarn repository (Codespaces)..."
sudo rm -f /etc/apt/sources.list.d/yarn.list

# -------------------------------
# Install Java 21 (Minecraft 1.21)
# -------------------------------
echo "[4/10] Installing Java 21..."
sudo apt update
sudo apt install -y openjdk-21-jdk

# -------------------------------
# Verify Java
# -------------------------------
echo "[5/10] Verifying Java..."
java -version

# -------------------------------
# Accept EULA
# -------------------------------
echo "[6/10] Accepting Minecraft EULA..."
echo "eula=true" > "$SERVER_DIR/eula.txt"

# -------------------------------
# First server run (AUTO SHUTDOWN)
# -------------------------------
echo "[7/10] First server run (generate files, then auto-shutdown)..."
cd "$SERVER_DIR"

# Start server and shut it down cleanly
echo "stop" | java -Xms1G -Xmx1G -jar server.jar nogui

# -------------------------------
# Force online-mode=false
# -------------------------------
echo "[8/10] Setting online-mode=false..."

PROPERTIES_FILE="$SERVER_DIR/server.properties"

if grep -q "^online-mode=" "$PROPERTIES_FILE"; then
  sed -i 's/^online-mode=.*/online-mode=false/' "$PROPERTIES_FILE"
else
  echo "online-mode=false" >> "$PROPERTIES_FILE"
fi

# -------------------------------
# Create start.sh in root
# -------------------------------
echo "[9/10] Creating start.sh..."

cat << 'EOF' > "$ROOT_DIR/start.sh"
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
EOF


chmod +x "$ROOT_DIR/start.sh"

# -------------------------------
# Done
# -------------------------------
echo "[10/10] Installation complete!"
echo "✔ Server initialized and shut down safely"
echo "✔ online-mode=false applied"
echo "✔ Run ./start.sh to start the server"
echo "=============================="
