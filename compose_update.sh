#!/usr/bin/env bash

docker compose pull
docker compose down
docker compose up -d --build
sleep 5
docker compose logs
echo "do 'docker compose logs -f'"
