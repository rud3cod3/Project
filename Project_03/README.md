# Jenkins CI/CD with Docker: EatBurger Project

## Project Overview

This project demonstrates a **full CI/CD pipeline using Jenkins and Docker** for deploying a simple HTML site (`eatBurger`) on a single host machine.  

- **Jenkins** runs in a Docker container and orchestrates the pipeline.  
- **Docker** is installed on the host and handles container builds and deployments.  
- Pipeline pulls code from GitHub, builds a Docker image, and deploys a container on the host.  
- Jenkins job and pipeline data are persisted using Docker volumes (`jenkins-data`).  

---

## Architecture

+-----------------+
| Jenkins Container|
| - Jobs |
| - Plugins |
| - Docker CLI |
+-----------------+
|
| /var/run/docker.sock
v
+-----------------+
| Host Docker Daemon|
| - Builds images |
| - Runs containers|
+-----------------+
|
v
+-----------------+
| EatBurger App |
| - Runs in container|
| - Exposed via port|
+-----------------+

**Key Points:**

- Jenkins container does **not run containers itself**, it talks to the **host Docker daemon**.  
- All deployed containers live on the host.  
- Jobs, credentials, and plugins persist in the Docker volume `jenkins-data`.  

---

## Prerequisites

1. **Host Requirements**  
   - Docker installed and running (`/var/run/docker.sock` accessible)  
   - User with permissions to access Docker socket  

2. **Jenkins Requirements**  
   - Docker image: `jenkins/jenkins:lts-docker` (or standard LTS + CLI installed)  
   - Jenkins Docker plugin installed  
