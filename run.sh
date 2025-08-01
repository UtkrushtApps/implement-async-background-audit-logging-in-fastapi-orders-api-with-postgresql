#!/bin/bash
set -e

echo "Building and starting EcoOrder services..."
docker-compose up -d --build

sleep 8 # Wait for DB startup

echo "Applying initial schema..."
docker-compose exec -T db psql -U eco_user -d ecoorder < schema.sql

echo "Environment ready. FastAPI at http://localhost:8000, PostgreSQL at localhost:5432"
