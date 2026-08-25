#!/bin/bash
# Claude Code Remote Connection Setup
# Connects online VS Code terminal to local Termux Claude Code

set -e

echo "🔗 Setting up Claude Code Remote Connection..."

# Install cloudflared (free tunnel)
echo "📦 Installing Cloudflared..."
if ! command -v cloudflared &> /dev/null; then
    curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/local/bin/cloudflared
    chmod +x /usr/local/bin/cloudflared
fi

# Create tunnel script
cat > /usr/local/bin/claude-tunnel << 'TUNNEL'
#!/bin/bash
# Start Claude Code tunnel to local Termux

# Start SSH tunnel to local machine
# Replace YOUR_TERMUX_IP with your Termux IP address
# Find it with: ifconfig or ip addr

TUNNEL_PORT=8081
LOCAL_HOST="YOUR_TERMUX_IP"  # <-- CHANGE THIS
LOCAL_PORT=8080

echo "🌐 Starting Claude Code tunnel..."
echo "Local VS Code will be accessible at: http://localhost:$TUNNEL_PORT"

# Start cloudflared tunnel
cloudflared tunnel --url http://localhost:$LOCAL_PORT

TUNNEL

chmod +x /usr/local/bin/claude-tunnel

echo "✅ Claude Code Remote Connection ready!"
echo ""
echo "Next steps:"
echo "1. On your Termux, run: code-server --bind-addr 0.0.0.0:8080"
echo "2. On cloud, run: claude-tunnel"
echo "3. Share the tunnel URL with others"
