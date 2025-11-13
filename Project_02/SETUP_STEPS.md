# Multi-Webserver on Single VM using Docker

## Overview

This guide explains how to host multiple independent websites on one
virtual machine (VM) using Docker. Each site runs in its own container,
and is reachable from the host system through port forwarding.

All steps below are written to be executable directly inside your VM.
You can open this file with `vim SETUP_STEPS.md` while following along.

---

## Step 1: System update

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo systemctl enable --now docker
docker version
docker run --rm hello-world

## Step 2: Create project structure

mkdir -p ~/multi-webserver/{site1,site2}
cd ~/multi-webserver
echo "<h1>Welcome to Site 1</h1>" > site1/index.html
echo "<h1>Welcome to Site 2</h1>" > site2/index.html
vim site1/index.html
vim site2/index.html

## Step 3: Run two Nginx containers

docker run -d --name site1 --restart unless-stopped \
  -p 8091:80 -v ~/multi-webserver/site1:/usr/share/nginx/html:ro nginx:alpine

docker run -d --name site2 --restart unless-stopped \
  -p 8092:80 -v ~/multi-webserver/site2:/usr/share/nginx/html:ro nginx:alpine

docker ps

## Step 4: Verify access from VM

curl http://localhost:8091
curl http://localhost:8092


## Step 5: Enable firewall ports (if UFW active)
sudo ufw allow 8091/tcp
sudo ufw allow 8092/tcp
sudo ufw status


## Step 6: Configure port forwarding to host
VirtualBox method

Power off VM.

Go to: Settings → Network → Adapter 1 → Advanced → Port Forwarding.

Add two rules:

TCP | 127.0.0.1 | Host Port: 8091 | Guest Port: 8091

TCP | 127.0.0.1 | Host Port: 8092 | Guest Port: 8092


## Step 7: Test from host system

curl http://127.0.0.1:8091
curl http://127.0.0.1:8092


## Step 8: Architecture Layout

Host Machine
  ├── Port 8091 → VM:8091 → Docker site1 (nginx)
  └── Port 8092 → VM:8092 → Docker site2 (nginx)
