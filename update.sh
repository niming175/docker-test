#!/bin/bash

if [ $# -gt 0 ]; then
  hash=$1
else
  hash=latest
fi

echo "version: $hash"

sed -i.bak "/app-backend:/s/\(app-backend:\)\([^\"]*\)/\1${$hash}/" docker-compose.yml
sed -i.bak "/app-nginx:/s/\(app-nginx:\)\([^\"]*\)/\1${hash}/" docker-compose.yml

docker-compose pull

docker-compose up -d --renew-anon-volumes

