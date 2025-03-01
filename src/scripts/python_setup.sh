#!/bin/bash

# Source common functions
source $(dirname "$0")/common.sh

# Ensure Homebrew is installed and updated
ensure_homebrew

# Install Python
if ! command -v python3 &> /dev/null; then
    log "Installing Python..."
    brew install python || handle_error "Python installation"
else
    log "Python is already installed."
fi

# Verify Python installation
log "Verifying Python installation..."
python3 --version || handle_error "Python verification"

# Install pip (Python package manager)
if ! command -v pip3 &> /dev/null; then
    log "Installing pip..."
    brew install pip || handle_error "pip installation"
else
    log "pip is already installed."
fi

# Verify pip installation
log "Verifying pip installation..."
pip3 --version || handle_error "pip verification"

# Install virtualenv for Python environment management
if ! command -v virtualenv &> /dev/null; then
    log "Installing virtualenv..."
    pip3 install virtualenv || handle_error "virtualenv installation"
else
    log "virtualenv is already installed."
fi

# Verify virtualenv installation
log "Verifying virtualenv installation..."
virtualenv --version || handle_error "virtualenv verification"

log "Python setup completed successfully."