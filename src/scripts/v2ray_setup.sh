#!/bin/bash

# Source common functions
source $(dirname "$0")/common.sh

# Ensure Homebrew is installed and updated
ensure_homebrew

# Check if V2Ray is already installed
if ! command -v v2ray &> /dev/null; then
    # Update Homebrew
    log "Updating Homebrew..."
    brew update || handle_error "Homebrew update"

    # Install V2Ray
    log "V2Ray not found. Installing V2Ray..."
    brew install v2ray || handle_error "V2Ray installation"
else
    log "V2Ray is already installed."
fi

# Create V2Ray configuration directory if it doesn't exist
log "Creating V2Ray configuration directory..."
mkdir -p $(brew --repo)/etc/v2ray || handle_error "creating V2Ray configuration directory"

# Copy the configuration file
log "Copying V2Ray configuration file..."
cp $(pwd)/../configs/v2ray.config $(brew --repo)/etc/v2ray/config.json || handle_error "copying V2Ray configuration file"

# Start V2Ray
log "Starting V2Ray..."
brew services start v2ray || handle_error "starting V2Ray"

log "V2Ray installation and configuration completed successfully."
log "Now socks5 proxy is running on
  Host:127.0.0.1    Port:10808
Enjoy the free world!"