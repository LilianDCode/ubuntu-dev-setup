#!/bin/bash

# Configuration for the setup script
DOCKER_GPG_URL="https://download.docker.com/linux/ubuntu/gpg"
MS_GPG_URL="https://packages.microsoft.com/keys/microsoft.asc"
WARP_GPG_URL="https://releases.warp.dev/linux/keys/warp.asc"

echo "LDCODE Ubuntu development environment installer."

# Ensure script runs with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# Function to set GPG keys for Docker
set_docker_gpg() {
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL $DOCKER_GPG_URL | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
}

# Function to install Docker-CE and Docker Compose
install_docker() {
    if command -v docker &> /dev/null; then
        echo "Docker is already installed. ✅"
        echo "Checking docker compose ..."
        if docker compose version &> /dev/null; then
            echo "Docker Compose is already installed. ✅"
        else
            apt-get install -y docker-compose-plugin
        fi
    else
        echo "Installing Docker-CE and Docker Compose..."
        apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && echo "Docker installation complete. ✅"
        if id "$USER" >/dev/null 2>&1; then
            usermod -aG docker "$USER"
        fi
    fi
}

# Function to set GPG keys for VS Code
set_vscode_gpg() {
    wget -qO- $MS_GPG_URL | gpg --dearmor > packages.microsoft.gpg
    install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | tee /etc/apt/sources.list.d/vscode.list
}

# Function to install VS Code
install_vscode() {
    if command -v code &> /dev/null; then
        echo "VS Code is already installed. ✅"
    else
        echo "Installing VS Code..."
        apt-get install -y code && echo "VS Code installation complete. ✅"
    fi
}

# Function to set GPG keys for Warp Terminal
set_warp_gpg() {
    wget -qO- $WARP_GPG_URL | gpg --dearmor > warpdotdev.gpg
    install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" | tee /etc/apt/sources.list.d/warpdotdev.list
    rm warpdotdev.gpg
}

# Function to install Warp Terminal
install_warp() {
    local set_default=$1
    if command -v warp-terminal &> /dev/null; then
        echo "Warp Terminal is already installed. ✅"
    else
        echo "Installing Warp Terminal..."
        apt-get install -y warp-terminal && echo "Warp Terminal installation complete. ✅"
        if [ "$set_default" = true ]; then
            update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/warp-terminal 100
            update-alternatives --set x-terminal-emulator /usr/bin/warp-terminal
        fi
    fi
}

# Function to install postman
install_postman() {
    if command -v postman &> /dev/null; then
        echo "Postman is already installed. ✅"
    elif command -v snap &> /dev/null; then
        echo "Installing Postman from the Snap Store..."
        snap install postman && echo "Postman installation complete. ✅"
    else
        # Install postman from the deb package
        echo "Installing Postman from the deb package..."
        wget -qO /tmp/postman.tar.gz https://dl.pstmn.io/download/latest/linux && \
        tar -xzf /tmp/postman.tar.gz -C /opt && \
        ln -s /opt/Postman/Postman /usr/bin/postman && \
        rm /tmp/postman.tar.gz && \
        echo "Postman installation complete. ✅"
    fi
}

# Function to run the interactive mode
run_interactive_mode() {
    tools=$(echo -e "Docker\nVSCode\nWarp\nPostman" | fzf --multi --height 10 --border --prompt="Select the tools to install (tab to select/unselect): ")

    if [ -z "$tools" ]; then
        echo "Installation cancelled."
        exit 1
    fi

    for choice in $tools; do
        case $choice in
            Docker)
                INSTALL_DOCKER=true
                ;;
            VSCode)
                INSTALL_VSCODE=true
                ;;
            Warp)
                INSTALL_WARP=true
                ;;
            Postman)
                INSTALL_POSTMAN=true
                ;;
        esac
    done

    # Ask user if they want to set Warp as the default terminal
    if [ "$INSTALL_WARP" = true ]; then
        read -r -p "Do you want to set Warp as the default terminal? [y/N]: " set_warp_default
        if [[ "$set_warp_default" =~ ^[Yy]$ ]]; then
            SET_WARP_DEFAULT=true
        fi
    fi
}

# Function to update and install packages
update_and_install() {
    IS_DOCKER_INSTALLED=$(command -v docker &> /dev/null && docker compose version &> /dev/null && echo true || echo false)
    IS_VSCODE_INSTALLED=$(command -v code &> /dev/null && echo true || echo false)
    IS_WARP_INSTALLED=$(command -v warp-terminal &> /dev/null && echo true || echo false)

    SHOULD_UPDATE=false
    $INSTALL_DOCKER && ! $IS_DOCKER_INSTALLED && set_docker_gpg && SHOULD_UPDATE=true
    $INSTALL_VSCODE && ! $IS_VSCODE_INSTALLED && set_vscode_gpg && SHOULD_UPDATE=true
    $INSTALL_WARP && ! $IS_WARP_INSTALLED && set_warp_gpg && SHOULD_UPDATE=true

    $SHOULD_UPDATE && apt-get update

    $INSTALL_DOCKER && install_docker
    $INSTALL_VSCODE && install_vscode
    $INSTALL_WARP && install_warp $SET_WARP_DEFAULT
    $INSTALL_POSTMAN && install_postman
}

# Function to display help message
display_help() {
    echo "Usage: $0 [options]"
    echo
    echo "Options:"
    echo "  -a, --all             Install all tools (Docker, VSCode, Warp)"
    echo "  -p, --postman         Install Postman"
    echo "  -d, --docker          Install Docker-CE and Docker Compose"
    echo "  -v, --vscode          Install Visual Studio Code"
    echo "  -w, --warp            Install Warp Terminal"
    echo "  -s, --set-warp-default  Set Warp Terminal as the default terminal"
    echo "  -h, --help            Display this help message"
    exit 0
}

# Parse command-line arguments
INTERACTIVE=true
INSTALL_DOCKER=false
INSTALL_VSCODE=false
INSTALL_WARP=false
INSTALL_POSTMAN=false
SET_WARP_DEFAULT=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -a|--all) INSTALL_DOCKER=true; INSTALL_VSCODE=true; INSTALL_WARP=true; INSTALL_POSTMAN=true; INTERACTIVE=false ;;
        -p|--postman) INSTALL_POSTMAN=true; INTERACTIVE=false ;;
        -d|--docker) INSTALL_DOCKER=true; INTERACTIVE=false ;;
        -v|--vscode) INSTALL_VSCODE=true; INTERACTIVE=false ;;
        -w|--warp) INSTALL_WARP=true; INTERACTIVE=false ;;
        -s|--set-warp-default) SET_WARP_DEFAULT=true ;;
        -h|--help) display_help ;;
        *) echo "Unknown option: $1"; display_help ;;
    esac
    shift
done

install_if_not_found() {
    local package=$1
    local command=${2:-$1}

    if ! command -v "$command" &> /dev/null
    then
        echo "$package could not be found, installing now..."
        apt update && apt install "$package" -y && echo "$package installation complete. ✅"
    fi
}

install_if_not_found curl
install_if_not_found wget
install_if_not_found gpg
install_if_not_found lsb-release lsb_release

if [ "$INTERACTIVE" = true ]; then
    install_if_not_found fzf
    run_interactive_mode
fi

update_and_install

echo "Setup complete! ✅ Please restart your terminal or log out and back in."
