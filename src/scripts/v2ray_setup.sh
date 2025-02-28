#!/bin/bash

# Function to log messages
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Function to handle errors
handle_error() {
    log "Error occurred during $1. Do you want to continue? (y/n)"
    read -r response
    if [[ "$response" != "y" ]]; then
        log "Setup aborted."
        exit 1
    fi
}

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    log "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || handle_error "Homebrew installation"
else
    log "Homebrew is already installed."
fi

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