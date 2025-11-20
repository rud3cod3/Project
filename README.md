#### Project 01 VIRTUAL BOX AND PORT MAPPING 
Using virtual box and created Two vm run a webserver there also used port Forwarding. Tried simulating Dev and Test server all the implementation was done manually

#### Project 02 VIRTUAL BOX AND PORT MAPPING AND ATTACHING PORT TO DOCKER CONTAINER
Used on VM in that used docker ran two docker container and used port forwarding so we can access containers web application which is running in docker which is in a vm and access it from host machine

#### Project 03  USED JENKINS | CLONE CODE AND BUILD IMAGE AND STARTED CONTAINER FROM IT | BASIC CICD
Used docker image of jenkins and created a pipeline job which download code from github and deploy on the same server where jenkins is running also created a docker-compose file to use docker compose, In this we have used volumes to make data persistent and also atached docker.sock file so we dont have to like download the docker in the container itself 

#### Project 04 CAPSTONE AWS
This project demonstrates the design and deployment of a highly available, scalable, and secure web application architecture on AWS using core infrastructure services such as VPC, EC2, EFS, Auto Scaling, ALB, and Route53. The goal is to build a production-grade environment that can automatically scale during demand spikes, ensure uptime across multiple Availability Zones, and maintain consistent shared storage across multiple servers.

#### Project 05 Containerize React App
I used docker to containerize a react applicaton and used dockerfile and docker-compose file to make it available and i also used port mapping. i did it with 2 way one by using dockerfile and second by using docker-compose.yml. i also learned what difference both files have and how to use them.

#### Project 06 Containerize Simple php app
I used docker to containerize a php applicatipn and used dockerfie and docker-compose file to make and use docker image and containers. Additionally i used port mapping to make it available to the host browser. I also learned some more information about apache2 and its modules and what is apache2 and how modules assist it to be a sucessfull webserver.

### Project 07 
This project demonstrates how to build a simple Python Flask application, package it into a Docker image, and push that image to Docker Hub.

### Project 08
A multi-service voting system built with Python, Redis, .NET, PostgreSQL, and Node.js. The Python frontend collects votes and stores them in Redis, a .NET processor pulls and saves the processed results into PostgreSQL, and a Node.js service displays the final output. All components are containerized with Docker and connected using linked containers.
