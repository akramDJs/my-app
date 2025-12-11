# Use official Node image
FROM node:18

WORKDIR /app

# Copy package.json (and package-lock.json if you want)
COPY package.json package-lock.json* ./

# Install dependencies (use npm install instead of npm ci)
RUN npm install

# Copy the rest of the app
COPY . .

# Build React app
RUN npm run build

# Install serve globally to serve the build
RUN npm install -g serve

# Expose port 5000
EXPOSE 5000

# Start the app
CMD ["serve", "-s", "build", "-l", "5000"]
