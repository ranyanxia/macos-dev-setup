#!/bin/bash

# Install Kubernetes tools

echo "Installing kubectl..."
brew install kubectl

echo "Installing kind..."
brew install kind

echo "Installing Ollama..."
brew install ollama

echo "Kubernetes tools installation completed."