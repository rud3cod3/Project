## Overview
This project is a lightweight PHP application running inside a Docker container. The goal was to understand how to containerize a simple PHP app, structure the project files neatly, and run everything using Docker Compose. The project includes a small frontend (HTML/CSS) and a basic API endpoint.

## File structure 

'''bash
Project_06
├── docker-compose.yml
├── Dockerfile
└── src
    ├── api.php
    ├── css
    │   └── style.css
    └── index.php

## What This Project Demonstrates

### 1. Containerizing a PHP Application
    * Selecting a PHP base image.
    * Configuring the container to serve .php files.
    * Copying application files into the image.
    * Exposing the correct port.

### 2. Using Docker Compose for Multi‑Service Management
    * created a docker-compose.yml
        * Defines a web service.  
        * Maps container ports to the host.
        * Mounts the local src/ directory for development.
        * Makes it easy to start/stop the whole environment.

### 3. Building a Clean Project Structure
    * Keeping source code inside the src/ directory helps maintain clarity. This structure keeps configuration files (Compose, Dockerfile) separate from application logic.

### 4. Understanding How PHP Runs Inside Docker
    * How containers execute PHP.
    * How the web server and PHP interpreter are packaged.
    * How file mounting lets you edit code in real time.


## To Run This Project

### 1. Build and Start the Container

'''bash
docker-compose up --build -d

'''

### 2. Access the Application
Open your browser:

'''bash
http://localhost:8080

'''

### 3. Stop the Containers

'''bash
docker compose down

'''
