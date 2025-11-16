# Docker Project

## Description : 
I have used Dockerfile to create a docker image and used dockers relative command to run that container from the image. Also i create docker compose file to create and run the container so i did it both ways from using Dockerfile and from using Docker-compose.yml file

## Tech stack
    * react
    * docker 
    * nginx

## Key Learning
    * learned how to deploy react project
    * used docker to contanerize react-aaplication
    * learned what is diffrence between dockerfile and docker-compose.yml also learned when to use Which  
    * much more

## Build Steps

## 1. To use Dockerfile
    
    '''bash
    * install docker 
    * clone repo and cd into dir
    * docker build . -t react-app:1.0
    * docker run -d --name react-container -p 3000:80 react-app:1.0
    '''

* Now check on hosts browser http://localhost:3000

## 2. To use docker compose

    '''bash
    * install docker
    * cd into it
    * docker compose up -d
