<p>
  <img src="/gitcraft-logo.png" alt="GitCraft Logo" width="300">
</p>

# GitCraft Server

Host a Minecraft **1.21** server in the cloud using **GitHub Codespaces** with up to **16 GB RAM**—no local setup, no PC overload. Clone, run one script, and play with friends.

> ⚠️ This project currently supports **Minecraft Java Edition 1.21 only**.

---

## 🚀 Quick Start (Fully Automatic)

### 1️⃣ Create a Private Repository
- Create a **new private repository** in your GitHub account  
- Initialize it with a **README.md**

---

### 2️⃣ Start a GitHub Codespace (16 GB RAM)
- Open your private repository  
- Click **Code → Codespaces → Create codespace**  
- Select a **16 GB RAM** machine (or the highest available)

---

### 3️⃣ Download and Run the Setup Script
Run the following commands inside the Codespaces terminal:

```bash
curl -O https://github.com/princemerja1/GitCraft-Server/blob/3355e06cbdabb094287030ea0d7e161ea379a07a/install.sh
```

```bash
chmod +x setup.sh
```

```bash
./setup.sh
```

---

## ⚙️ What `setup.sh` Does
- Downloads the **latest Minecraft server** of your choice (**Vanilla or Paper**)
- Sets up a **complete Minecraft server structure**
- Installs **essential performance plugins** for a lag-free experience
- Installs **playit.gg** to generate a **public server URL**
- Generates a **`start.sh`** script to start the server anytime

---

## ▶️ Starting the Server & Setting Up Playit Tunnel

After installation is complete, start the server using:

```bash
./start.sh
```

### Setting Up Playit.gg Tunnel

Once the server is running, you need to set up a public tunnel using **playit.gg**:

1. **Split the terminal** (Terminal → Split Terminal or `Ctrl+Shift+5`)

2. In the new terminal pane, run:
```bash
./playit
```

3. **Set up the playit agent:**
   - Follow the on-screen instructions to claim the agent
   - Visit the URL provided in the terminal to authenticate
   - Configure the tunnel settings for **Minecraft Java Edition (port 25565)**
   - Select your preferred server region

4. **Get your server address:**
   - Once setup is complete, you'll see a public server URL in your terminal
   - This URL will also appear on your [playit.gg dashboard](https://playit.gg/account/tunnels)
   - Share this address with your friends to let them join

> 💡 **Watch this tutorial** for detailed setup instructions: [Playit.gg Setup Guide](https://youtu.be/xCuZZ5kmVbM?si=oSx0ypvrKgrqzQjs&t=78) (watch from 0:00 to 1:18)

---

## 🎮 Play With Friends
- Codespaces exposes a public address using **playit.gg**
- Share the generated server address with your friends
- The server runs **only while the Codespace is active**

---

## 🛑 Stop the Server

To stop the server safely:

1. In the server terminal, press:
```bash
Ctrl + C
```

2. In the playit terminal, press:
```bash
Ctrl + C
```

---

## ⚠️ Important Notes
- Best suited for **SMPs, testing, learning, and temporary hosting**
- Not recommended for **24/7 public servers**
- Deleting the Codespace will remove all server data
- Keep the playit.gg tunnel running while players are connected

---

## ⭐ Support
If this project helped you, consider **starring the repository** to support development.
