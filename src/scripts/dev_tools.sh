#!/bin/bash

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install Git
echo "Installing Git..."
brew install git

# Install GitHub CLI
echo "Installing GitHub CLI..."
brew install gh

# Install Node.js
echo "Installing Node.js..."
brew install node

# Install Yarn
echo "Installing Yarn..."
brew install yarn

# Install Chrome
echo "Installing Chrome..."
brew install --cask google-chrome

# Install Edge
echo "Installing Edge..."
brew install --cask microsoft-edge

# Install v2ray
echo "Installing v2ray..."
brew install v2ray

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
brew install --cask visual-studio-code

# Install IntelliJ IDEA
echo "Installing IntelliJ IDEA..."
brew install --cask intellij-idea

echo "Development tools installation completed."