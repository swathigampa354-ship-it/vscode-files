#!/bin/bash
# VS Code Server Cloud Deployment Script
# Supports: Render, Railway, Fly.io, Docker

set -e

echo "🚀 VS Code Server Cloud Deployment"
echo "=================================="

# Check for Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker not found. Please install Docker first."
    exit 1
fi

# Check for Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose not found. Please install Docker Compose first."
    exit 1
fi

# Build and start
echo "📦 Building Docker image..."
docker-compose build

echo "🔧 Starting VS Code Server..."
docker-compose up -d

echo "✅ VS Code Server is running!"
echo "🌐 Access at: http://localhost:8080"
echo ""
echo "To stop: docker-compose down"
echo "To view logs: docker-compose logs -f"
