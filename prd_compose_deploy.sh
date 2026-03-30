#!/usr/bin/env bash

set -e

echo "🔄 Pull latest images..."
docker compose pull

echo "🚀 Recreate only updated services..."
docker compose up -d --no-deps --force-recreate growry linkhub

echo "⏳ Waiting for PostgreSQL to be ready..."

# postgresコンテナ内で接続可能になるまで待つ
until docker compose exec -T postgres pg_isready -U appuser > /dev/null 2>&1; do
  sleep 2
  echo "⏳ waiting..."
done

echo "🛠 Running DB init script..."
docker compose exec -T growry npm run db:init

echo "📦 Status:"
docker compose ps

echo "📜 Logs:"
docker compose logs --tail=50
