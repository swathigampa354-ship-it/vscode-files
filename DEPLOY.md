# VS Code Server Cloud Deployment

Deploy VS Code Server to cloud platforms with one click.

## Quick Deploy

### Docker (Local)
```bash
# Clone and deploy
git clone https://github.com/swathigampa354-ship-it/vscode-files.git
cd vscode-files

# Set your password
export PASSWORD=your_secure_password
export SUDO_PASSWORD=your_secure_password

# Deploy with Docker
docker-compose up -d

# Access at http://localhost:8080
```

### Render
[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

1. Click the button above or:
   - Fork this repository
   - Go to [Render Dashboard](https://dashboard.render.com)
   - Create new Web Service
   - Connect your GitHub repo
   - Select Docker environment
   - Set environment variables:
     - `PASSWORD`: Your access password
     - `SUDO_PASSWORD`: Your sudo password
   - Deploy

### Railway
[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template?template=https://github.com/swathigampa354-ship-it/vscode-files)

1. Click the button above or:
   - Fork this repository
   - Go to [Railway Dashboard](https://railway.app/dashboard)
   - Create new project
   - Deploy from GitHub repo
   - Set environment variables
   - Deploy

### Fly.io
```bash
# Install Fly.io CLI
curl -L https://fly.io/install.sh | sh

# Login
fly auth login

# Launch
fly launch

# Deploy
fly deploy

# Set secrets
fly secrets set PASSWORD=your_secure_password
fly secrets set SUDO_PASSWORD=your_secure_password

# Access
fly open
```

## Platform Comparison

| Platform | Free Tier | Sleep After | Cold Start | Custom Domain |
|----------|-----------|-------------|------------|---------------|
| Render | 750 hrs/mo | 15 min | ~30s | ✅ |
| Railway | $5 credit | 30 min | ~10s | ✅ |
| Fly.io | 3 shared VMs | 5 min | ~5s | ✅ |
| Docker | Unlimited | Never | Instant | ✅ |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PASSWORD` | Access password | `password` |
| `SUDO_PASSWORD` | Sudo password | `password` |
| `TZ` | Timezone | `UTC` |
| `PUID` | User ID | `1000` |
| `PGID` | Group ID | `1000` |

## Custom Domain Setup

### Render
1. Go to Service Settings
2. Add custom domain
3. Update DNS records

### Railway
1. Go to Settings → Networking
2. Add custom domain
3. Configure DNS

### Fly.io
```bash
fly certs add yourdomain.com
fly ips allocate-v4
# Update DNS A record to assigned IP
```

## Security Notes

⚠️ **Important**: Always set strong passwords before deploying to production!

1. Use environment variables for sensitive data
2. Enable HTTPS (most platforms provide this automatically)
3. Consider adding IP restrictions if needed
4. Regularly update dependencies

## Troubleshooting

### Container Won't Start
```bash
# Check logs
docker-compose logs

# Or for specific platform
fly logs
render logs
```

### Can't Connect
1. Verify port 8080 is exposed
2. Check firewall rules
3. Ensure password is set correctly

### Performance Issues
- Upgrade to paid tier for more resources
- Use a region closer to your users
- Consider using a CDN for static assets

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

MIT License - feel free to use and modify for your needs.
