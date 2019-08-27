#!/bin/sh

# install Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 10

# Download code
wget https://github.com/rtalexk/elb_classic/archive/master.zip
unzip master.zip
rm master.zip

# Install code
cd elb_classic-master
npm install

# Install Nginx
sudo amazon-linux-extras install nginx1.12

# Configure Nginx Proxy
sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
sudo cp ./build/nginx.conf /etc/nginx/nginx.conf
sudo service nginx restart

# Start Nginx on server restart
sudo chkconfig nginx on

# Run project
npm start
