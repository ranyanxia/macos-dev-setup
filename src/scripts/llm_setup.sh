#!/bin/bash

# Source common functions
source $(dirname "$0")/common.sh

# Ensure Homebrew is installed and updated
ensure_homebrew

# Install Ollama
if ! command -v ollama &> /dev/null; then
    log "Installing Ollama..."
    brew install ollama || handle_error "Ollama installation"
else
    log "Ollama is already installed."
fi

# install DeepSeek R1
pull_deepseek_r1() {
    log "Pulling DeepSeek R1..."
    ollama pull deepseek-r1:14b || handle_error "pulling DeepSeek R1"
}

log "Ollama installation completed."