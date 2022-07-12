#!/bin/bash

echo '--- Start install ruby ---'
apt update && sleep 10 && apt install -y ruby-full ruby-bundler build-essential
echo '--- Finish install ruby ---'
