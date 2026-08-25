FROM linuxserver/code-server:latest

# Install additional packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    nodejs \
    npm \
    python3 \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install global npm packages
RUN npm install -g \
    typescript \
    ts-node \
    nodemon \
    prettier \
    eslint \
    serve \
    http-server

# Install Python packages
RUN pip3 install \
    black \
    flake8 \
    mypy \
    pytest \
    requests \
    flask \
    django

# Copy configuration files
COPY .vscode/ /config/.vscode/
COPY scripts/ /config/scripts/

# Make scripts executable
RUN chmod +x /config/scripts/*.sh

# Install extensions via script
RUN /config/scripts/install-extensions.sh

# Setup Kickbacks auth
RUN /config/scripts/setup-kickbacks-auth.sh

# Set environment variables
ENV PUID=1000
ENV PGID=1000
ENV TZ=UTC

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080 || exit 1

# Start code-server
CMD ["/init"]
