#!/bin/bash

cd ../terraform/stage
APP_IP=51.250.65.44 # $(terraform output external_ip_address_app)
DB_IP=51.250.82.38 # $(terraform output external_ip_address_db)

echo "{\"app\": {\"hosts\": [\"$APP_IP\"]}, \"db\": {\"hosts\": [\"$DB_IP\"]}}"
