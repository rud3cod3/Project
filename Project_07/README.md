# Overview

This project demonstrates how to build a simple Python Flask application, package it into a Docker image, and push that image to Docker Hub.
The goal is to understand:

* How to write a correct and minimal Dockerfile
* How to build and tag Docker images
* How to push images to a Docker registry
* How to run the container locally

# Project Structure

```bash
Project_07/
├── Dockerfile
└── app.py
```

# Objective

1. How to containerize a Python Flask application
2. How to optimize a basic Dockerfile
3. How to properly tag and push images to Docker Hub
4. How to run the resulting Docker container

# Source Codes

```bash
# app.py

import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def main():
    return "<h1> Python Flask App </h1>"

@app.route("/v1")
def hello():
    return "<h1> This is response from V1 </h1>"

if __name__ = "__main__":
    app.run(host="0.0.0.0", port=8000)
```

```bash
# Dockerfile

FROM ubuntu:20.04
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install flask
COPY app.py /opt/
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
```

# Build, Tag, and Push the Image

1. Build the image 
```bash
docker build -t python-flask-app:1.0.0 .
```

2. Tag the image for Docker Hub
```bash 
docker tag python-flask-app:1.0.0 agn3y/devops6722:1.0.0
```

3. Push to Docker Hub
```bash
docker push agn3y/devops6722:1.0.0
```

# Run the Container
```bash
docker run -d --name python-flask-app -p 8080:8080 python-flask-app:1.0.0
```

# LINK
```
http://localhost:8080

