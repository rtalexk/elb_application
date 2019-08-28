#!/bin/bash

# Download code
wget https://github.com/rtalexk/elb_classic/archive/master.zip
unzip master.zip
rm -f master.zip

# Grant exec permissions and execute
chmod 755 elb_classic-master/build/bootstrap.sh
./elb_classic-master/build/bootstrap.sh
