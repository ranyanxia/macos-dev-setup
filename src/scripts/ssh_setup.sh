#!/bin/bash

# Check if SSH key already exists
if [ -f "$HOME/.ssh/id_rsa" ]; then
    echo "SSH key already exists at $HOME/.ssh/id_rsa"
else
    # Generate SSH key
    echo "Generating SSH key..."
    ssh-keygen -t rsa -b 4096 -C "ranyanxia@gmail.com" -f "$HOME/.ssh/id_rsa" -N ""

    # Start the ssh-agent in the background
    eval "$(ssh-agent -s)"

    # Add SSH key to the ssh-agent
    ssh-add "$HOME/.ssh/id_rsa"

    echo "SSH key generated and added to ssh-agent."
fi