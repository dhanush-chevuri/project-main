FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy dependency files and install packages
COPY package.json package-lock.json ./
RUN npm install

# Copy the full source code
COPY . .

# Expose Medusa backend's default port
EXPOSE 7001

# Start Medusa in production mode
CMD ["medusa", "start"]
