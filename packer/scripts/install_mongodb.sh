#!/bin/bash

echo '--- Start install mongodb ---'
#wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodborg/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update && sleep 10

#apt-get install -y mongodb-org
#systemctl start mongod
#systemctl enable mongod
apt-get install -y mongodb
systemctl start mongodb
systemctl enable mongodb
echo '--- Finish install mongodb ---'
