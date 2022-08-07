#!/bin/bash

cd ../terraform/stage
APP_IP=$(terraform output external_ip_address_app)
DB_IP=$(terraform output external_ip_address_db)

echo "{\"app\": {\"hosts\": [\"$APP_IP\"]}, \"db\": {\"hosts\": [\"$DB_IP\"]}}"
