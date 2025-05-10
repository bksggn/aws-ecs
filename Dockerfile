FROM node:18-slim

# Install nginx and pm2
RUN apt-get update &&     apt-get install -y nginx &&     npm install -g pm2 &&     apt-get clean && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy Node app files
COPY package*.json ./
RUN npm install
COPY app.js .
COPY ecosystem.config.js .

# Copy HTML files for nginx
COPY html/ /usr/share/nginx/html

# Copy nginx config
COPY nginx.conf /etc/nginx/sites-available/default

# Remove default nginx site and enable ours
RUN rm /etc/nginx/sites-enabled/default &&     ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Expose ports: 80 for nginx, 8080 for Node
EXPOSE 80 8080

# Start both services
CMD ["sh", "-c", "nginx && pm2-runtime ecosystem.config.js"]
