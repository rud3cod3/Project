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

