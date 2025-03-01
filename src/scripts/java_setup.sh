#!/bin/bash

# Source common functions
source $(dirname "$0")/common.sh

# Ensure Homebrew is installed and updated
ensure_homebrew

# Install OpenJDK
if ! command -v java &> /dev/null; then
    log "Installing OpenJDK..."
    brew install openjdk || handle_error "OpenJDK installation"
else
    log "OpenJDK is already installed."
fi

# Install Maven
if ! command -v mvn &> /dev/null; then
    log "Installing Maven..."
    brew install maven || handle_error "Maven installation"
else
    log "Maven is already installed."
fi

log "OpenJDK and Maven installation completed."