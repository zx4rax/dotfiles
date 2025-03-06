#!/bin/bash

echo "🔹 Starting installation of security tools..."

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Go if not installed
if ! command_exists go; then
    echo "🔹 Installing Go..."
    sudo apt update && sudo apt install -y golang || sudo yum install -y golang || brew install go
fi

# Set Go path
export PATH=$PATH:$(go env GOPATH)/bin
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.zshrc
source ~/.bashrc || source ~/.zshrc

# Install each tool
install_tool() {
    tool_name=$1
    repo_url=$2
    echo "🔹 Installing $tool_name..."
    go install $repo_url@latest
}

install_tool "gau" "github.com/lc/gau/v2/cmd/gau"
install_tool "gf" "github.com/tomnomnom/gf"
install_tool "uro" "github.com/s0md3v/uro"
install_tool "Gxss" "github.com/KathanP19/Gxss"
install_tool "kxss" "github.com/Emoe/kxss"

# Set up gf patterns
if [ ! -d "$HOME/.gf" ]; then
    echo "🔹 Setting up gf patterns..."
    mkdir -p ~/.gf
    git clone https://github.com/1ndianl33t/Gf-Patterns ~/.gf
fi

echo "✅ Installation complete!"

