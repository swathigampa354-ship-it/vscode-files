#!/bin/bash
# Kickbacks Auth Setup Script
# Run this to configure Kickbacks authentication

set -e

echo "🔐 Setting up Kickbacks Authentication..."

# Create config directory
mkdir -p ~/.kickbacks

# Create auth.json
cat > ~/.kickbacks/auth.json << 'EOF'
{
  "refresh": "plain:1:lDisXnB2h5d0WTxbKWDeyaRHendhZhKANwBF91nLOH0jX_kn5tYuSRPi4I2WxJjG",
  "clientId": "kickterma1b2c3d4e5f6"
}
EOF

# Set proper permissions
chmod 600 ~/.kickbacks/auth.json

echo "✅ Kickbacks authentication configured!"
echo "📍 Config location: ~/.kickbacks/auth.json"
echo ""
echo "To verify authentication:"
echo "  1. Open VS Code"
echo "  2. Open Command Palette (Ctrl+Shift+P)"
echo "  3. Run 'Kickbacks: Check Authentication'"
