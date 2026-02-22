#!/bin/sh

# Get the PORT from environment variable, default to 80
PORT=${PORT:-80}

# Update nginx config to listen on the correct port
sed -i "s/listen 80;/listen ${PORT};/" /etc/nginx/conf.d/default.conf

# Also update the server_name if needed
sed -i "s/server_name localhost;/server_name _;/" /etc/nginx/conf.d/default.conf

echo "Starting nginx on port ${PORT}..."

# Start nginx
nginx -g "daemon off;"
