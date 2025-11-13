# Multi-VM Web Server Setup using Ubuntu Servers

## Overview
This project demonstrates how to deploy a simple web application using two Ubuntu Server virtual machines configured as web servers.

The main goal was to understand Linux networking, DNS resolution, and manual server configuration, while gaining hands-on experience with DevOps practices like automation and infrastructure setup.

The base code was sourced online, but I customized it and modified configuration files to explore how networking and DNS actually work in Linux.

---

## Architecture
- VM1: Web Server 1  
- VM2: Web Server 2  
- Both servers: Ubuntu 22.04 LTS  
- Networking: Configured manually using `/etc/hosts` for hostname resolution

### Network Flow
1. Requests are made using hostnames defined in `/etc/hosts`
2. Linux resolver checks `/etc/hosts` before DNS queries
3. Each VM hosts its own Nginx (or Apache) instance serving a test page
4. Connectivity tested using `ping` and `curl` commands

---

## Key Learning Areas

### 1. Linux Networking
- Edited `/etc/hosts` to define internal hostnames
- Understood order of name resolution in Linux
- Verified connections with:
  ```bash
  ping webserver1
  curl webserver2

### 2. DNS and Host Resolution

Simulated a basic DNS setup using /etc/hosts

Learned about /etc/resolv.conf and /etc/nsswitch.conf

Explored lookup tools: nslookup, dig

### 3. Web Server Setup

Installed and configured Nginx on both VMs:

sudo apt update
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx


Customized index page:

echo "Welcome to $(hostname)" | sudo tee /var/www/html/index.html

### 4. Shell Script Automation

Created a setup script to automate installation and configuration.

Example:

#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
echo "Welcome to $(hostname)" | sudo tee /var/www/html/index.html
sudo systemctl enable nginx
sudo systemctl start nginx

What I Learned

Internal working of Linux hostname resolution

Manual IP mapping and connectivity checks

DNS fallback order and resolver flow

Basic web server configuration and service management

Shell scripting for automation

Debugging with ping, curl, ss, netstat
