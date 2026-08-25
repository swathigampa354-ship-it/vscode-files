#!/bin/bash
# VS Code Server Keepalive Script
# Prevents VS Code Server from timing out on remote connections

KEEPALIVE_INTERVAL=300  # 5 minutes
LOG_FILE="/tmp/vscode-keepalive.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

keepalive() {
    while true; do
        # Touch a file to keep the connection alive
        touch /tmp/vscode-keepalive-$(date +%s)
        
        # Clean up old keepalive files (older than 1 hour)
        find /tmp -name "vscode-keepalive-*" -mmin +60 -delete 2>/dev/null
        
        log "Keepalive ping sent"
        sleep $KEEPALIVE_INTERVAL
    done
}

# Start keepalive in background
keepalive &
echo $! > /tmp/vscode-keepalive.pid
log "Keepalive started with PID $(cat /tmp/vscode-keepalive.pid)"
