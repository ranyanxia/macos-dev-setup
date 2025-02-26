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

# Source .zshrc
log "Linking .zshrc..."
ln -s $(pwd)/src/configs/.zshrc ~/.zshrc || handle_error "linking .zshrc"
log ".zshrc linked successfully."

# Run SSH setup
log "Running SSH setup..."
bash src/scripts/ssh_setup.sh || handle_error "SSH setup"
log "SSH setup completed."

# Run Python setup
log "Running Python setup..."
bash src/scripts/python_setup.sh || handle_error "Python setup"
log "Python setup completed."

# Run Java setup
log "Running Java setup..."
bash src/scripts/java_setup.sh || handle_error "Java setup"
log "Java setup completed."

# Run development tools setup
log "Running development tools setup..."
bash src/scripts/dev_tools.sh || handle_error "development tools setup"
log "Development tools setup completed."

# Run Docker setup
log "Running Docker setup..."
bash src/scripts/docker_setup.sh || handle_error "Docker setup"
log "Docker setup completed."

# Run Kubernetes setup
log "Running Kubernetes setup..."
bash src/scripts/k8s_setup.sh || handle_error "Kubernetes setup"
log "Kubernetes setup completed."

log "All setup steps completed successfully."