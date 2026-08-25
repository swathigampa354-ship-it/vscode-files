#!/bin/bash
# VS Code Server Setup Script for Termux
# Run this script to set up VS Code Server on a new Termux installation

set -e

echo "Setting up VS Code Server for Termux..."

# Update packages
pkg update -y && pkg upgrade -y

# Install required packages
pkg install -y curl wget git nodejs npm python

# Install code-server
curl -fsSL https://code-server.dev/install.sh | sh

# Create VS Code settings directory
mkdir -p ~/.local/share/code-server/User

# Copy settings
cp .vscode/settings.json ~/.local/share/code-server/User/settings.json

# Install recommended extensions
echo "Installing extensions..."
code-server --install-extension esbenp.prettier-vscode
code-server --install-extension dbaeumer.vscode-eslint
code-server --install-extension eamodio.gitlens
code-server --install-extension ms-vscode.vscode-typescript-next
code-server --install-extension bradlc.vscode-tailwindcss
code-server --install-extension christian-kohler.path-intellisense
code-server --install-extension usernamehw.errorlens
code-server --install-extension streetsidesoftware.code-spell-checker
code-server --install-extension editorconfig.editorconfig
code-server --install-extension ms-vscode.live-server
code-server --install-extension humao.rest-client
code-server --install-extension ms-python.python
code-server --install-extension ms-python.vscode-pylance
code-server --install-extension charliermarsh.ruff
code-server --install-extension rust-lang.rust-analyzer
code-server --install-extension tamasfe.even-better-toml
code-server --install-extension redhat.vscode-yaml
code-server --install-extension ms-azuretools.vscode-docker
code-server --install-extension hashicorp.terraform
code-server --install-extension github.vscode-github-actions
code-server --install-extension ms-vscode.remote-ssh
code-server --install-extension ms-vscode.remote-containers
code-server --install-extension formulahendry.auto-rename-tag
code-server --install-extension formulahendry.auto-close-tag
code-server --install-extension vincaslt.highlight-matching-tag

# Setup keepalive script
chmod +x scripts/vscode-keepalive.sh
cp scripts/vscode-keepalive.sh ~/scripts/

# Create autostart entry
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/vscode-keepalive.desktop << EOF
[Desktop Entry]
Type=Application
Name=VS Code Keepalive
Exec=~/scripts/vscode-keepalive.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF

echo "Setup complete!"
echo "Start code-server with: code-server --bind-addr 0.0.0.0:8080"
echo "Access it at: http://localhost:8080"
