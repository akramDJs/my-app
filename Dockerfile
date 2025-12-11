FROM node:18
WORKDIR /app

# Copy package files
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Build React app
RUN npm run build

# Install serve globally
RUN npm install -g serve

# Set the port Railway expects
ENV PORT 5000

# Expose port
EXPOSE 5000

# Start app in foreground using $PORT
CMD ["serve", "-s", "build", "-l", "5000"]
