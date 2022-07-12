#!/bin/bash

echo '--- Start install reddit ---'
cp /tmp/reddit.service /etc/systemd/system/reddit.service

apt update && sleep 10 && apt install -y git
git clone -b monolith https://github.com/express42/reddit.git
bundle install --gemfile=reddit/Gemfile
systemctl start reddit
systemctl enable reddit

echo '--- Finish install reddit ---'
