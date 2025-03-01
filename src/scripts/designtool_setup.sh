#!/bin/bash

# Source common functions
source $(dirname "$0")/common.sh

# Ensure Homebrew is installed and updated
ensure_homebrew

# Install Figma
if ! command -v figma &> /dev/null; then
    log "Installing Figma..."
    brew install figma || handle_error "Figma installation"
else
    log "Figma is already installed."
fi