#!/bin/bash

# Function to add IP address to /etc/hosts
add_to_hosts() {
    # 185.199.108.133
    # 185.199.109.133
    # 185.199.110.133
    # 185.199.111.133
    local ip_address="185.199.108.133"
    local hostname="raw.githubusercontent.com"
    if ! grep -q "$hostname" /etc/hosts; then
        echo "Adding $hostname to /etc/hosts..."
        echo "$ip_address $hostname" | sudo tee -a /etc/hosts > /dev/null
    else
        echo "$hostname already exists in /etc/hosts."
    fi
}

# Check for Homebrew, install if we don't have it
# if test ! $(which brew); then
    echo "Installing Homebrew..."

    # Check if the URL is accessible
    if ! curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o /dev/null; then
        add_to_hosts
    fi

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi

# Change Homebrew source to Chinese mirror
echo "Changing Homebrew source to Chinese mirror..."
brew_repo=$(brew --repo)
if [ -d "$brew_repo" ]; then
    git -C "$brew_repo" remote set-url origin https://mirrors.ustc.edu.cn/brew.git
else
    echo "Homebrew repository not found at $brew_repo"
fi

homebrew_core_repo="$brew_repo/Library/Taps/homebrew/homebrew-core"
if [ -d "$homebrew_core_repo" ]; then
    git -C "$homebrew_core_repo" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
else
    echo "Homebrew core repository not found at $homebrew_core_repo"
fi

homebrew_cask_repo="$brew_repo/Library/Taps/homebrew/homebrew-cask"
if [ -d "$homebrew_cask_repo" ]; then
    git -C "$homebrew_cask_repo" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git
else
    echo "Homebrew cask repository not found at $homebrew_cask_repo"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

echo "Homebrew installation and update complete."