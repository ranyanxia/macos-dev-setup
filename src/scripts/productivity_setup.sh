#!/bin/bash

# Source common functions
source $(dirname "$0")/common.sh

# ensure Homebrew is installed and updated
ensure_homebrew

# function to install rectangle
if ! brew list --cask rectangle &> /dev/null; then
    log "Installing Rectangle..."
    brew install --cask rectangle || handle_error "Rectangle installation"
else
    log "Rectangle is already installed."
fi