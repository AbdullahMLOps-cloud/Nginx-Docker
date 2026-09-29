# Nginx + Docker + Node.js

This project demonstrates how to run a simple Node.js application behind an Nginx reverse proxy using Docker Compose.

## Overview
The application stack contains two services:

- `app`: a Node.js Express app running on port `3000`
- `nginx`: an Nginx reverse proxy that listens on port `8080` and forwards requests to the app service

This setup is useful for learning container networking, reverse proxy configuration, and Docker-based deployment patterns.

## Architecture
```text
Browser
  -> http://localhost:8080
      -> Nginx container (port 80)
          -> app container (port 3000)
              -> Express app
```

## Project Structure
```text
.
├── app.js
├── Dockerfile
├── docker-compose.yml
├── nginx.conf
├── package.json
├── README.md
```

## Files Explained
- `app.js` — Starts a simple Express server that returns a message on `/`
- `package.json` — Defines the Node.js app and dependency (`express`)
- `Dockerfile` — Builds the app image using a Node.js builder stage and a distroless runtime stage
- `nginx.conf` — Configures Nginx to proxy all incoming traffic to `http://app:3000`
- `docker-compose.yml` — Starts both containers and exposes Nginx on host port `8080`

## Prerequisites
Before running the project, make sure you have:

- Docker installed and running
- Docker Compose available
- Git (optional, if you are cloning the repo)

Verify your Docker installation:

```bash
docker --version
docker compose version
```

## Run the Project
From the project directory, run:

```bash
docker compose up --build
```

This will build the app image and start both containers.

## Access the Application
Open the following URL in your browser:

```text
http://localhost:8080
```

You should see a response like:

```text
Hello from Abdullah Node.js app
```

You can also test it from the terminal:

```bash
curl http://localhost:8080
```

## Stop the Containers
To stop and remove the running containers:

```bash
docker compose down
```

To run the stack in the background:

```bash
docker compose up --build -d
```

To view logs:

```bash
docker compose logs -f
```

To check container status:

```bash
docker compose ps
```

## Docker Details
### Application container
The app uses a lightweight Node.js image, installs production dependencies, and starts the Express server on port `3000`.

### Nginx container
Nginx listens on port `80` inside the container and is published to host port `8080` via Docker Compose.

The `nginx.conf` file forwards all requests to the app service:

```nginx
events {}
http {
    server {
        listen 80;
        location / {
            proxy_pass http://app:3000;
        }
    }
}
```

## Notes
- The app service is not exposed directly to the host; it is only reachable internally via the Docker network.
- Nginx acts as a reverse proxy and exposes the service publicly on port `8080`.
- This is a simple demonstration of container orchestration and request forwarding.

## Example Response
The app returns:

```text
Hello from Abdullah Node.js app
```

## Summary
This project is a simple and effective example of deploying a Node.js application with Nginx using Docker Compose, demonstrating reverse proxying, service-to-service communication, and containerized deployment.
