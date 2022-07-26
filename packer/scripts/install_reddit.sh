#!/bin/bash

echo '--- Start install reddit ---'
mv /tmp/puma.service /etc/systemd/system/puma.service

apt update && sleep 10 && apt install -y git
git clone -b monolith https://github.com/express42/reddit.git
bundle install --gemfile=reddit/Gemfile
systemctl start reddit
systemctl enable reddit

echo '--- Finish install reddit ---'
