#!/bin/bash

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install Docker
if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    brew install --cask docker
else
    echo "Docker is already installed."
fi

# Install Podman
if ! command -v podman &> /dev/null; then
    echo "Installing Podman..."
    brew install podman
else
    echo "Podman is already installed."
fi

echo "Docker and Podman installation completed."