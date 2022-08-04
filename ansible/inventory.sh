#!/bin/bash

cd ../terraform/prod
#APP_IP=$(terraform output external_ip_address_app)
#DB_IP=$(terraform output external_ip_address_db)
APP_IP=$(yc compute instance get reddit-app --format=json | python3 -c "import sys, json; print(json.load(sys.stdin)['network_interfaces'][0]['primary_v4_address']['one_to_one_nat']['address'])")
DB_IP=$(yc compute instance get reddit-db --format=json | python3 -c "import sys, json; print(json.load(sys.stdin)['network_interfaces'][0]['primary_v4_address']['one_to_one_nat']['address'])")

echo "{\"app\": {\"hosts\": [\"$APP_IP\"]}, \"db\": {\"hosts\": [\"$DB_IP\"]}}"
