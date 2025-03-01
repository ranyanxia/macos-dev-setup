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
# Function to ensure Homebrew is installed & updated
ensure_homebrew() {
    if ! command -v brew &> /dev/null; then
        log "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || handle_error "Homebrew installation"
    else
        #update Homebrew
        log "Updating Homebrew..."
        brew update || handle_error "Homebrew update"
        log "Homebrew is already installed and updated."
    fi
}