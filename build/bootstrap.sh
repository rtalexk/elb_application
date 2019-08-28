#!/bin/bash

cd ~/

yum update -y

# install Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
ls -la
. ~/.nvm/nvm.sh
nvm install 10

# Install code
cd elb_classic-master
npm install

# Install Nginx
amazon-linux-extras install nginx1.12

# Configure Nginx Proxy
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
cp ./build/nginx.conf /etc/nginx/nginx.conf
service nginx restart

# Start Nginx on server restart
chkconfig nginx on

# Run project
npm start
