# Add Homebrew to PATH for Apple Silicon
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# function to set proxy
fq() {
    # check if v2ray is running
    if ! pgrep v2ray &> /dev/null; then
        echo "V2Ray is not running. Please start V2Ray first. Run 'brew services start v2ray' to start V2Ray."
        return
    fi

    export all_proxy="socks5://127.0.0.1:10808"
    echo "Proxy on - enjoying the free world!"
}

# function to disable proxy
unset-fq() {
    unset all_proxy
    echo "Proxy off - Goodbye!"
}

# function to set system proxy
sysfq() {
    # check if v2ray is running
    if ! pgrep v2ray &> /dev/null; then
        echo "V2Ray is not running. Please start V2Ray first. Run 'brew services start v2ray' to start V2Ray."
        return
    fi

    sudo networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 10808
    sudo networksetup -setsocksfirewallproxystate Wi-Fi on
    echo "System proxy set to SOCKS proxy at 127.0.0.1:10808"
}

# function to disable system proxy
unset-sysfq() {
    sudo networksetup -setsocksfirewallproxystate Wi-Fi off
    echo "System proxy disabled."
}