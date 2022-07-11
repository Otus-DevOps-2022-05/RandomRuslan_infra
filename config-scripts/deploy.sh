#!/bin/bash

sudo ./install_ruby.sh
sudo ./install_mongodb.sh

sudo apt update && sudo apt install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install && puma -d
