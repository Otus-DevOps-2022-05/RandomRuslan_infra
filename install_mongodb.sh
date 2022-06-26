#!/bin/bash

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodborg/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update

sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
#sudo apt-get install -y mongodb
#sudo systemctl start mongodb
#sudo systemctl enable mongodb
