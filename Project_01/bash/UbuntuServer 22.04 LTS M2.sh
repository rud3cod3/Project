#!/bin/bash

set -e

# Update linux and install nginx + unzip
sudo apt update -y
sudo apt install nginx unzip -y

# Start, enable & nginx
nginx_func() {
    sudo systemctl enable nginx
    sudo systemctl start nginx
}

# Now checking nginx
nginx_status=$(systemctl is-active nginx)

if [ "$nginx_status" = "active" ]; then
    echo "Nginx is running!"
else
    echo "Nginx is not running. Trying to start it..."
    nginx_func
fi

# Download, Extract and Copy Code 
sudo curl -L https://www.tooplate.com/zip-templates/2079_garage.zip -o /opt/2079_pop.zip
sudo unzip -o /opt/2079_pop.zip -d /opt/2079_pop/
sudo rm -rf /var/www/html/*
sudo cp -r /opt/2079_pop/* /var/www/html/

# Restart nginx
sudo systemctl restart nginx
