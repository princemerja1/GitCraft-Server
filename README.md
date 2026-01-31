<p>
  <img src="/gitcraft-logo.png" alt="GitCraft Logo" width="300">
</p>


Host a Minecraft server in the cloud using **GitHub Codespaces** with up to **16 GB RAM**—no local setup, no PC overload. Clone, run one script, and play with friends.

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
curl -O https://raw.githubusercontent.com/<your-username>/gitcraft-server/main/setup.sh
```
```bash
chmod +x setup.sh
```
```bash
./setup.sh
```

## ⚙️ What `install.sh` Does
- Downloads the **latest Minecraft server** of your choice (**Vanilla or Paper**)
- Sets up a **complete Minecraft server structure**
- Installs **essential performance plugins** for a lag-free experience
- Installs **playit.gg** to generate a **public server URL**
- Generates a **`start.sh`** script to start the server anytime

---

## ▶️ Starting the Server Later
After installation is complete, start the server using:

```bash
./start.sh
```

## 🎮 Play With Friends
- Codespaces exposes a public address using **playit.gg**
- Share the generated server address with your friends
- The server runs **only while the Codespace is active**

---

## 🛑 Stop the Server
To stop the server safely, press:

```bash
Ctrl + C
```


## ⚠️ Important Notes
- Best suited for **SMPs, testing, learning, and temporary hosting**
- Not recommended for **24/7 public servers**
- Deleting the Codespace will remove all server data

## ⭐ Support
If this project helped you, consider **starring the repository** to support development.

