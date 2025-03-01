#!/bin/bash

# Source common functions
source $(dirname "$0")/common.sh

# function to configure Docker
configure_docker() {
    log "Configuring Docker..."
    mkdir -p ~/.docker
    # backup the existing configuration if it exists
    if [ -f ~/.docker/daemon.json ]; then
        mv ~/.docker/daemon.json ~/.docker/daemon.json.bak
    fi
    
    cp $(pwd)/../configs/docker-daemon.json ~/.docker/daemon.json || handle_error "configuring Docker"
    log "Docker configured successfully."
}

# Ensure Homebrew is installed and updated
ensure_homebrew

# Install Docker
if ! command -v docker &> /dev/null; then
    log "Installing Docker..."
    brew install --cask docker || handle_error "Docker installation"
else
    log "Docker is already installed."
    # Configure Docker
    configure_docker
fi

# Install Podman
if ! command -v podman &> /dev/null; then
    log "Installing Podman..."
    brew install podman || handle_error "Podman installation"
else
    log "Podman is already installed."
fi

# Install Kind
if ! command -v kind &> /dev/null; then
    log "Installing Kind..."
    brew install kind || handle_error "Kind installation"

    # #configure Kind using recommended settings
    # kind create cluster --name kind
    # log "Kind configured successfully."
else
    log "Kind is already installed."
fi

log "Docker and Podman installation completed."