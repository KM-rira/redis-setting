#!/usr/bin/env bash

set -e

echo "🔄 Pull latest images..."
docker compose pull

echo "🚀 Recreate only updated services..."
docker compose up -d --no-deps --force-recreate growry linkhub

echo "📦 Status:"
docker compose ps

echo "📜 Logs:"
docker compose logs --tail=50
