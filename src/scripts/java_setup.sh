#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install OpenJDK
echo "Installing OpenJDK..."
brew install openjdk

# Install Maven
echo "Installing Maven..."
brew install maven

echo "OpenJDK and Maven installation completed."