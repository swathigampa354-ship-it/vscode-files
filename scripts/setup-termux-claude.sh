#!/bin/bash
# Claude Code Termux Setup
# Run this on your Termux to enable remote connection

set -e

echo "🔧 Setting up Claude Code on Termux..."

# Check if Claude Code is installed
if ! command -v claude &> /dev/null; then
    echo "❌ Claude Code not found. Installing..."
    npm install -g @anthropic-ai/claude-code
fi

# Start code-server on Termux
echo "🚀 Starting VS Code Server on Termux..."
code-server --bind-addr 0.0.0.0:8080 &

# Wait for server to start
sleep 5

# Get Termux IP address
TERMUX_IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | head -1)

echo "✅ Claude Code is running on Termux!"
echo ""
echo "📱 Your Termux IP: $TERMUX_IP"
echo "🌐 VS Code Server: http://$TERMUX_IP:8080"
echo ""
echo "To connect from cloud VS Code:"
echo "1. Edit scripts/setup-claude-remote.sh"
echo "2. Set LOCAL_HOST to: $TERMUX_IP"
echo "3. Run: claude-tunnel"
