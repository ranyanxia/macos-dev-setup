#!/bin/bash

source $(dirname "$0")/common.sh

# Ensure Homebrew is installed and updated
ensure_homebrew

# Install Git
if ! command -v git &> /dev/null; then
    log "Installing Git..."
    brew install git || handle_error "Git installation"
else
    log "Git is already installed."
fi

# Install GitHub CLI
if ! command -v gh &> /dev/null; then
    log "Installing GitHub CLI..."
    brew install gh || handle_error "GitHub CLI installation"
else
    log "GitHub CLI is already installed."
fi

# Install Yarn
if ! command -v yarn &> /dev/null; then
    log "Installing Yarn..."
    brew install yarn || handle_error "Yarn installation"
else
    log "Yarn is already installed."
fi

# Install Chrome
if ! brew list --cask google-chrome &> /dev/null; then
    log "Installing Chrome..."
    brew install --cask google-chrome || handle_error "Chrome installation"
else
    log "Chrome is already installed."
fi

# Install Edge
if ! brew list --cask microsoft-edge &> /dev/null; then
    log "Installing Edge..."
    brew install --cask microsoft-edge || handle_error "Edge installation"
else
    log "Edge is already installed."
fi

# Install V2Ray
if ! command -v v2ray &> /dev/null; then
    log "Installing V2Ray..."
    brew install v2ray || handle_error "V2Ray installation"
else
    log "V2Ray is already installed."
fi

# Install Visual Studio Code
if ! brew list --cask visual-studio-code &> /dev/null; then
    log "Installing Visual Studio Code..."
    brew install --cask visual-studio-code || handle_error "Visual Studio Code installation"
else
    log "Visual Studio Code is already installed."
fi

# Install IntelliJ IDEA
if ! brew list --cask intellij-idea &> /dev/null; then
    log "Installing IntelliJ IDEA..."
    brew install --cask intellij-idea || handle_error "IntelliJ IDEA installation"
else
    log "IntelliJ IDEA is already installed."
fi

log "Development tools installation completed."