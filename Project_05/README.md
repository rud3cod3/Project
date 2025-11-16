#  Dockerized React Application

 ## This project demonstrates how to containerize and deploy a React application using **Docker**, serve it with **Nginx**, and run the application using both **Dockerfile** and **Docker Compose**.  
---

##  Tech Stack
- React  
- Docker  
- Nginx  

---

##  Key Learnings
- Building and deploying a production React application  
- Containerizing applications with Docker  
- Understanding when to use **Dockerfile** vs **docker-compose.yml**  
- Serving static frontend builds with Nginx  
- Working with port mapping, logs, container lifecycle  

---

#  Build & Run Instructions

##  1. Using Dockerfile

```bash
# Navigate to the project folder
cd <project-folder>

# Build the Docker image
docker build -t react-app:1.0 .

# Run the container
docker run -d --name react-container -p 3000:80 react-app:1.0
```
### View Logs
```bash
docker logs -f react-container
```

### Stop and Remove Container
```bash
docker stop react-container
docker rm react-container
```

---

##  2. Using Docker Compose (Recommended)

```bash
docker compose up --build -d
```

### View Running Services
```bash
docker compose ps
```

### Logs
```bash
docker compose logs -f
```

### Stop Everything
```bash
docker compose down
```

---

##  Difference Between Dockerfile & Docker Compose

### Dockerfile
- Defines **how an image is built**
- Contains build steps for React + Nginx
- Used when you want full control over image creation

### Docker Compose
- Defines **how containers run**
- Manages ports, networks, environment variables, restarts
- Ideal for multi-container setups and simpler workflow

Think of it like:
- **Dockerfile = Build recipe**
- **Compose = Container orchestrator**

---

##  Notes on Production Setup

- React production builds are automatically served by Nginx inside the container.  
- The container exposes port **80**, which is mapped to a host port (e.g., 3000).  
- Environment variables for Node are handled inside the build stage.

---
