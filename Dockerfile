# Use a slim, secure Node.js base image for production
FROM node:lts-slim

WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy the rest of the application source code
COPY . .

# Cloud Run provides the PORT environment variable automatically.
# Your server.js already uses process.env.PORT, which is perfect.

# Switch to the non-root user
USER node

# Define the command to run the application using your server.js entrypoint
CMD ["node", "server.js"]