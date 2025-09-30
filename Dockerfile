# Base image
FROM node:20-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (dev dependencies included for dev)
RUN npm install

# Copy all backend code
COPY . .

# Expose port from environment variable
ARG PORT=5000
ENV PORT=${PORT}
EXPOSE ${PORT}

# Command: use nodemon in development, node in production
ARG NODE_ENV=development
CMD if [ "$NODE_ENV" = "development" ]; then npm run dev; else node index.js; fi
