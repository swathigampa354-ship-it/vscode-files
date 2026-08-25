# VS Code Server Configuration for Termux

A complete VS Code Server setup optimized for Termux on Android, with pre-configured settings, extensions, and automation scripts.

## Features

- **Terminal Integration**: Pre-configured bash terminal with proper environment variables
- **Extensions**: Essential extensions for web development, Python, Rust, and more
- **Keybindings**: Custom keyboard shortcuts for productivity
- **Snippets**: Code snippet suggestions enabled
- **Keepalive**: Automatic keepalive script to prevent timeout on remote connections
- **Setup Script**: One-click installation on new Termux instances

## Quick Start

```bash
# Clone this repository
git clone https://github.com/swathigampa354-ship-it/vscode-files.git
cd vscode-files

# Run the setup script
chmod +x scripts/setup-vscode-server.sh
./scripts/setup-vscode-server.sh

# Start code-server
code-server --bind-addr 0.0.0.0:8080
```

## What's Included

### Configuration Files
- `.vscode/settings.json` - Editor, terminal, and theme settings
- `.vscode/extensions.json` - Recommended extensions list
- `.vscode/keybindings.json` - Custom keyboard shortcuts
- `.vscode/snippets.code-snippets` - Snippet suggestions configuration

### Scripts
- `scripts/vscode-keepalive.sh` - Prevents timeout on remote connections
- `scripts/setup-vscode-server.sh` - Automated setup for new installations

### Extensions
- **Prettier** - Code formatter
- **ESLint** - JavaScript linting
- **GitLens** - Git integration
- **TypeScript** - TypeScript support
- **Tailwind CSS** - Tailwind IntelliSense
- **Python** - Python development
- **Rust Analyzer** - Rust support
- **Docker** - Container support
- **Remote SSH** - Remote development
- And many more...

## Terminal Configuration

The terminal is configured with:
- **Shell**: Bash with login shell
- **Environment**: Proper PREFIX, TMPDIR, and LD_PRELOAD settings
- **Scrollback**: 10,000 lines
- **Bell**: Disabled

## Customization

### Adding Extensions
Edit `.vscode/extensions.json` to add more extensions, then run:
```bash
code-server --install-extension <extension-id>
```

### Modifying Settings
Edit `.vscode/settings.json` to customize:
- Editor preferences
- Theme and appearance
- Language-specific settings
- Terminal behavior

### Keybindings
Edit `.vscode/keybindings.json` to add or modify keyboard shortcuts.

## Remote Access

To access code-server remotely:

```bash
# Start with external access
code-server --bind-addr 0.0.0.0:8080

# Access via browser
# http://<your-ip>:8080
```

## Troubleshooting

### Connection Issues
- Ensure port 8080 is open in your firewall
- Check if code-server is running: `ps aux | grep code-server`
- View logs: `cat ~/.local/share/code-server/logs/*/code-server.log`

### Extension Issues
- Reinstall extensions: `code-server --install-extension <extension-id>`
- Clear extension cache: `rm -rf ~/.local/share/code-server/extensions`

### Terminal Issues
- Verify bash path: `which bash`
- Check environment variables: `env | grep -E "(PREFIX|TMPDIR|LD_PRELOAD)"`

## License

MIT License - feel free to use and modify for your needs.
