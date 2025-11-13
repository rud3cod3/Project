# Multi-Webserver VM using Docker

A compact, production-minded lab that demonstrates how to host multiple
independent web services on a single virtual machine (VM) using Docker.
Each service runs in its own container and is reachable from the host
via NAT port forwarding or an SSH tunnel.

This repository contains:
- step-by-step instructions to reproduce the environment,
- clear verification and troubleshooting commands,
- notes on real-world use cases and what you learn from the exercise.

---

## Project summary

Run two isolated web servers inside Docker containers on a single VM.
Expose each service to the host using port forwarding (VirtualBox NAT) or
SSH local port forwarding. This shows how to manage container networking,
simple static deployments, and VM-host integration.

---

## Where this idea is useful (use-cases)

- **Development sandbox**: Quickly host multiple services for local QA,
  integration tests, or front-end/back-end demos on a single VM.
- **Edge or lab deployments**: Lightweight on-premises demos where a small
  VM hosts several isolated services.
- **Teaching & interviews**: Demonstrates container networking, port
  mapping, firewall rules, and basic service orchestration — perfect for
  lessons or interview showcase.
- **Proof of concept (PoC)**: Validate small services before moving to cloud
  infrastructure (load balancers, service mesh, or Kubernetes).

---

## What you will learn

- Installing and verifying Docker on a Linux VM.
- Running and managing Docker containers (`docker run`, volumes, restart
  policies).
- VM ↔ host networking: NAT port forwarding and SSH tunneling.
- Basic host firewall configuration (UFW) for container ports.
- Using `docker compose` to manage multi-container apps.
- Common verification and troubleshooting steps for containerized services.

---

## Repository layout


