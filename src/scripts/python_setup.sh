#!/bin/bash

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install Python
echo "Installing Python..."
brew install python

# Verify Python installation
echo "Verifying Python installation..."
python3 --version

# Install pip (Python package manager)
echo "Installing pip..."
brew install pip

# Verify pip installation
echo "Verifying pip installation..."
pip3 --version

# Install virtualenv for Python environment management
echo "Installing virtualenv..."
pip3 install virtualenv

# Verify virtualenv installation
echo "Verifying virtualenv installation..."
virtualenv --version

echo "Python setup completed successfully."