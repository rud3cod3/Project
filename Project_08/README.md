# Real-Time Voting System — Architecture & Deployment

### Description :
This project is a small multi-service setup that demonstrates how a voting workflow can be implemented using different technologies working together inside Docker containers.

* Python Frontend – Accepts user input and stores votes in Redis.
* Redis – Acts as an in-memory message/queue layer between services.
* .NET Processor – Pulls data from Redis, performs the required logic, and saves the results in PostgreSQL.
* PostgreSQL – Persistent storage for finalized voting results.
* Node.js Backend – Reads the data from PostgreSQL and displays the live/processed voting output.

### 1. Architecture Flow

```bash
User → Python Frontend → Redis → .NET Processor → PostgreSQL → Node.js Display
```

```bash
| Component          | Role                                                                            |
| ------------------ | ------------------------------------------------------------------------------- |
| **Python App**     | Collects votes from users and pushes entries to Redis.                          |
| **Redis**          | Temporary buffer for incoming votes.                                            |
| **.NET Service**   | Fetches votes from Redis, processes them, and stores the results in PostgreSQL. |
| **PostgreSQL**     | Final persistent database for vote results.                                     |
| **Node.js Server** | Reads processed results from PostgreSQL and exposes an endpoint/UI for display. |
```

### 2. Docker Setup

#### Build Docker image

```bash
docker build -t python-frontend ./python
docker build -t dotnet-processor ./dotnet
docker build -t node-display ./node
```

#### Now use link to connect all the container with each other

```bash
docker run -d --name redis redis
docker run -d --name postgres -e POSTGRES_PASSWORD=pass postgres

docker run -d --name python-frontend --link redis python-frontend
docker run -d --name dotnet-processor --link redis --link postgres dotnet-processor
docker run -d --name node-display --link postgres -p 3000:3000 node-display
```

### 3. How the Services Communicate

* Python → Redis
    * The Python service publishes vote data into Redis using simple key/value or list operations.

* .NET Service → Redis → PostgreSQL
    * The .NET service:
        1. Reads pending votes from Redis
        2. Applies domain logic
        3. Saves processed results into PostgreSQL

* Node.js → PostgreSQL
    * Node queries the saved results and exposes them through an API or web page.
