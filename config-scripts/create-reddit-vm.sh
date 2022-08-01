#!/bin/bash

SVC_ACCT=reddit-terraform
FOLDER_ID=$(yc config get folder-id)

yc iam service-account create --name $SVC_ACCT --folder-id $FOLDER_ID
ACCT_ID=$(yc iam service-account get $SVC_ACCT | grep ^id | awk '{print $2}')

yc resource-manager folder add-access-binding \
 --id $FOLDER_ID \
 --role editor \
 --service-account-id $ACCT_ID

yc iam key create --service-account-id $ACCT_ID --output key.json

cd packer

packer build -var-file variables.json immutable.json

TS=$(date +%s)
yc compute instance create \
 --name reddit-app-$TS \
 --hostname reddit-app-$TS \
 --memory=4 \
 --create-boot-disk image-family=reddit-full,size=10GB \
 --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
 --metadata serial-port-enable=1 \
 --ssh-key ~/.ssh/appuser.pub \
 --zone ru-central1-a
