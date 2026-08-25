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
COPY *.vsix /config/extensions/

# Make scripts executable
RUN chmod +x /config/scripts/*.sh

# Install VS Code extensions
RUN code-server --install-extension esbenp.prettier-vscode && \
    code-server --install-extension dbaeumer.vscode-eslint && \
    code-server --install-extension eamodio.gitlens && \
    code-server --install-extension ms-vscode.vscode-typescript-next && \
    code-server --install-extension bradlc.vscode-tailwindcss && \
    code-server --install-extension christian-kohler.path-intellisense && \
    code-server --install-extension usernamehw.errorlens && \
    code-server --install-extension streetsidesoftware.code-spell-checker && \
    code-server --install-extension editorconfig.editorconfig && \
    code-server --install-extension ms-vscode.live-server && \
    code-server --install-extension humao.rest-client && \
    code-server --install-extension ms-python.python && \
    code-server --install-extension ms-python.vscode-pylance && \
    code-server --install-extension charliermarsh.ruff && \
    code-server --install-extension rust-lang.rust-analyzer && \
    code-server --install-extension tamasfe.even-better-toml && \
    code-server --install-extension redhat.vscode-yaml && \
    code-server --install-extension ms-azuretools.vscode-docker && \
    code-server --install-extension hashicorp.terraform && \
    code-server --install-extension github.vscode-github-actions && \
    code-server --install-extension ms-vscode.remote-ssh && \
    code-server --install-extension ms-vscode.remote-containers && \
    code-server --install-extension formulahendry.auto-rename-tag && \
    code-server --install-extension formulahendry.auto-close-tag && \
    code-server --install-extension vincaslt.highlight-matching-tag && \
    code-server --install-extension /config/extensions/kickbacks.vsix && \
    code-server --install-extension /config/extensions/claude-code.vsix

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
