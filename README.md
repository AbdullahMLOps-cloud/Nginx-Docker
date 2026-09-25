# Node.js, Docker, and Nginx Reverse Proxy

This project runs a small Express application behind an Nginx reverse proxy using Docker Compose.

The Node.js application listens on port `3000` inside the Docker network. Nginx listens on port `80` in its container and publishes it as port `8080` on the host, so requests should be made through `http://localhost:8080`.

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) 
- Git, if cloning this repository

Verify Docker is available:

```bash
docker --version
docker compose version
```
## Quick start

From the project directory, build and start both containers:

```bash
docker compose up --build
```

Open the application at:


http://localhost:8080


Or test it from a terminal:

```bash
curl http://localhost:8080


Expected response:


Hello from Abdullah Node.js app


The command runs in the foreground and streams container logs. Press `Ctrl+C` to stop the stack.

To start the stack in the background:

```bash
docker compose up --build -d
```

To stop and remove the containers:

```bash
docker compose down


## Common Docker Compose commands

View the current container status:

```bash
docker compose ps


Follow logs for all services:

```bash
docker compose logs -f
```
Recreate the stack after changing `docker-compose.yml` or `nginx.conf`:

```bash
docker compose up --build -d
```
Remove containers and the Compose network:

```bash
docker compose down

### Dockerfile

The Dockerfile uses two stages:

1. `node:22-slim` installs production dependencies and copies the application source.
2. `gcr.io/distroless/nodejs22-debian12` runs the application with a smaller runtime image and no shell.

The runtime image starts `app.js` with the distroless image's built-in Node.js entrypoint.







