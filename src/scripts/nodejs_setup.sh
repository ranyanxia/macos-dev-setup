#!/bin/bash

# Source common functions
source $(dirname "$0")/common.sh

# Ensure Homebrew is installed and updated
ensure_homebrew

# Install Node.js
if ! command -v node &> /dev/null; then
    log "Installing Node.js..."
    brew install node || handle_error "Node.js installation"
else
    log "Node.js is already installed."
fi

# Verify Node.js installation
log "Verifying Node.js installation..."
node --version || handle_error "Node.js verification"

# Install npm (Node.js package manager)
if ! command -v npm &> /dev/null; then
    log "Installing npm..."
    brew install npm || handle_error "npm installation"
else
    log "npm is already installed."
fi

# Verify npm installation
log "Verifying npm installation..."
npm --version || handle_error "npm verification"

log "Node.js setup completed successfully."