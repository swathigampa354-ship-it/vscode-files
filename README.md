# VS Code Server Configuration

A complete VS Code Server setup with pre-configured settings, extensions, and deployment scripts for cloud platforms.

## Features

- **Terminal Integration**: Pre-configured bash terminal with proper environment variables
- **Extensions**: Essential extensions for web development, Python, Rust, and more
- **Keybindings**: Custom keyboard shortcuts for productivity
- **Snippets**: Code snippet suggestions enabled
- **Keepalive**: Automatic keepalive script to prevent timeout on remote connections
- **Cloud Ready**: Docker, Render, Railway, Fly.io deployment configs

## Quick Start

### Docker (Recommended)
```bash
# Clone this repository
git clone https://github.com/swathigampa354-ship-it/vscode-files.git
cd vscode-files

# Set your password
export PASSWORD=your_secure_password
export SUDO_PASSWORD=your_secure_password

# Deploy with Docker
docker-compose up -d

# Access at http://localhost:8080
```

### Cloud Platforms
See [DEPLOY.md](DEPLOY.md) for detailed deployment instructions on:
- **Render** - Free tier with auto-sleep
- **Railway** - Easy deployment with $5 free credit
- **Fly.io** - Global edge deployment
- **Docker** - Self-hosted solution

## What's Included

### Configuration Files
- `.vscode/settings.json` - Editor, terminal, and theme settings
- `.vscode/extensions.json` - Recommended extensions list
- `.vscode/keybindings.json` - Custom keyboard shortcuts
- `.vscode/snippets.code-snippets` - Snippet suggestions configuration

### Deployment Files
- `Dockerfile` - Container configuration
- `docker-compose.yml` - Local development setup
- `render.yaml` - Render deployment config
- `railway.json` - Railway deployment config
- `fly.toml` - Fly.io deployment config
- `.github/workflows/deploy.yml` - GitHub Actions CI/CD

### Scripts
- `scripts/deploy-cloud.sh` - Automated cloud deployment
- `scripts/setup-vscode-server.sh` - Local Termux setup
- `scripts/vscode-keepalive.sh` - Prevent timeout on remote connections

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

### Docker
```bash
# Start with external access
docker-compose up -d

# Access via browser
# http://localhost:8080
```

### Cloud Platforms
Most platforms provide a public URL automatically. Check your platform dashboard for the URL.

## Troubleshooting

### Connection Issues
- Ensure port 8080 is open in your firewall
- Check if code-server is running: `docker ps`
- View logs: `docker-compose logs -f`

### Extension Issues
- Reinstall extensions: `code-server --install-extension <extension-id>`
- Clear extension cache: `rm -rf ~/.local/share/code-server/extensions`

### Terminal Issues
- Verify bash path: `which bash`
- Check environment variables: `env | grep -E "(PREFIX|TMPDIR|LD_PRELOAD)"`

## Security Notes

⚠️ **Important**: Always set strong passwords before deploying to production!

1. Use environment variables for sensitive data
2. Enable HTTPS (most platforms provide this automatically)
3. Consider adding IP restrictions if needed
4. Regularly update dependencies

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

MIT License - feel free to use and modify for your needs.
