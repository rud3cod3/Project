# Real-Time Voting System — Architecture & Deployment

### Description :
This project is a small multi-service setup that demonstrates how a voting workflow can be implemented using different technologies working together inside Docker containers.

* Python Frontend – Accepts user input and stores votes in Redis.
* Redis – Acts as an in-memory message/queue layer between services.
* .NET Processor – Pulls data from Redis, performs the required logic, and saves the results in PostgreSQL.
* PostgreSQL – Persistent storage for finalized voting results.
* Node.js Backend – Reads the data from PostgreSQL and displays the live/processed voting output.

### 1. Architecture Flow
