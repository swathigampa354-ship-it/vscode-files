#!/bin/bash
# VS Code Extensions Installer
# Run this script to install all required extensions

set -e

echo "🔧 Installing VS Code Extensions..."

# Check if code-server is available
if ! command -v code-server &> /dev/null; then
    echo "❌ code-server not found. Please install it first."
    exit 1
fi

# Install extensions from marketplace
echo "📦 Installing marketplace extensions..."
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

# Install Claude Code
echo "🤖 Installing Claude Code..."
code-server --install-extension anthropic.claude-code || echo "⚠️  Claude Code installation failed - install manually from marketplace"

# Install Kickbacks AI
echo "🚀 Installing Kickbacks AI..."
code-server --install-extension kickbacksai.kickbacks-ai || echo "⚠️  Kickbacks AI installation failed - install from VSIX file"

# Check for local VSIX files
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

if [ -f "$PARENT_DIR/kickbacks.vsix" ]; then
    echo "📦 Installing Kickbacks from local VSIX..."
    code-server --install-extension "$PARENT_DIR/kickbacks.vsix"
fi

if [ -f "$PARENT_DIR/claude-code.vsix" ]; then
    echo "📦 Installing Claude Code from local VSIX..."
    code-server --install-extension "$PARENT_DIR/claude-code.vsix"
fi

echo "✅ Extension installation complete!"
echo ""
echo "Installed extensions:"
code-server --list-extensions
