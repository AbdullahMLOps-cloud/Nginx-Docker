# Stage 1: Build & install dependencies
# Using node.js slim image for building the application

FROM node:22-slim AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

COPY . .

# Stage 2: Run (final image)
# Using Distroless image for running the application

FROM gcr.io/distroless/nodejs22-debian12

WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000
# The Entrypoint is already set to "node" in the distroless image se we will pass main script
  
CMD ["app.js"]
