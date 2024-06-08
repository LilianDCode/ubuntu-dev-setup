#!/bin/bash

# Function to ensure a command is installed
ensure_installed() {
    if ! command -v "$1" &>/dev/null; then
        echo "$1 not found. Installing $1..."
        apt update
        apt install -y "$1"
    fi
}

# Set the playbook directory
PLAYBOOK_DIR="$(dirname "$0")/playbooks"

# Function to handle cleanup on exit or interruption
cleanup() {
    echo "Cleaning up..."
    rm -rf "$TEMP_DIR"
    echo "Exiting."
}

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo"
    exit 1
fi

# Trap Ctrl+C (SIGINT) and call cleanup
trap cleanup SIGINT

# Ensure Ansible and curl are installed
install_ansible() {
    echo "Installing Ansible..."
    # The command should be (see PR #1281 https://github.com/pypa/pipx/pull/1281)
    # pipx --global install --include-deps ansible 
    # but still not available in the latest version of pipx with apt
    # So we will use the following command
    PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin pipx install --include-deps ansible
}

ensure_installed pipx
install_ansible
ensure_installed curl

# Create a temporary directory
TEMP_DIR=$(sudo -u "$SUDO_USER" mktemp -d)

# Available tools and corresponding playbooks
declare -A tools
tools=(
    ["git"]="git.yaml"
    ["docker"]="docker.yaml"
    ["vscode"]="vscode.yaml"
    ["warp"]="warp.yaml"
    ["postman"]="postman.yaml"
)

# Function to download or copy playbooks 
get_playbook() {
    local tool=$1
    local playbook=$2

    if [ -f "$PLAYBOOK_DIR/$playbook" ]; then
        sudo -u "$SUDO_USER" cp "$PLAYBOOK_DIR/$playbook" "$TEMP_DIR/$playbook"
    else
        local playbook_url="https://raw.githubusercontent.com/LilianDCode/ubuntu-setup/main/playbooks/$playbook"
        sudo -u "$SUDO_USER" curl -o "$TEMP_DIR/$playbook" "$playbook_url"
    fi
}

# Function to download or copy vscode-extensions.txt
get_extensions_file() {
    if [ -f "$PLAYBOOK_DIR/vars/vscode_extensions.yaml" ]; then
        sudo -u "$SUDO_USER" cp "$PLAYBOOK_DIR/vars/vscode_extensions.yaml" "$TEMP_DIR/vscode_extensions.yaml"
    else
        local extensions_url="https://raw.githubusercontent.com/LilianDCode/ubuntu-setup/main/playbooks/vars/vscode_extensions.yaml"
        sudo -u "$SUDO_USER" curl -o "$TEMP_DIR/vscode_extensions.yaml" "$extensions_url"
    fi
}

# Function to install a tool
install_tool() {
    local tool=$1
    local playbook=${tools[$tool]}
    echo "Installing $tool"
    get_playbook "$tool" "$playbook"
    ansible-playbook -i localhost, -c local -e "set_default_terminal=$SET_WARP_DEFAULT_TERMINAL" "$TEMP_DIR/$playbook"
}

# Function to install VSCode extensions
install_vscode_extensions() {
    get_extensions_file
    get_playbook "vscode-extensions" "vscode-extensions.yaml"
    sudo -u "$SUDO_USER" ansible-playbook -i localhost, -c local "$TEMP_DIR/vscode-extensions.yaml"
}

INSTALL_EXTENSIONS=0
SET_WARP_DEFAULT_TERMINAL=0
TOOLS_TO_INSTALL=()

# Parse arguments
if [ $# -eq 0 ]; then
    # Interactive mode if no arguments are provided
    ensure_installed fzf

    SELECTIONS=$(printf "%s\n" "${!tools[@]}" | fzf --multi --prompt="Select tools to install: ")

    # Check if selections are empty
    if [ -z "$SELECTIONS" ]; then
        echo "No tools selected. Exiting."
        cleanup
        exit 1
    fi

    # Install selected tools
    for tool in $SELECTIONS; do
        TOOLS_TO_INSTALL+=("$tool")
    done

    # Ask if the user wants to install VSCode extensions
    read -r -p "Do you want to install VSCode extensions? (y/n): " install_extensions_choice
    if [ "$install_extensions_choice" == "y" ]; then
        INSTALL_EXTENSIONS=1
    fi

    # Check if Warp is in the list of tools to install
    if [[ " ${TOOLS_TO_INSTALL[*]} " =~ " warp " ]]; then
        # Ask if the user wants to set Warp as the default terminal
        read -r -p "Do you want to set Warp as the default terminal? (y/n): " set_default_terminal_choice
        if [ "$set_default_terminal_choice" == "y" ]; then
            SET_WARP_DEFAULT_TERMINAL=1
        fi
    fi
else
    # Non-interactive mode
    for arg in "$@"; do
        case $arg in
        -a | --all)
            for tool in "${!tools[@]}"; do
                TOOLS_TO_INSTALL+=("$tool")
            done
            ;;
        -g|--git)
            TOOLS_TO_INSTALL+=("git")
            ;;
        -d | --docker)
            TOOLS_TO_INSTALL+=("docker")
            ;;
        -v | --vscode)
            TOOLS_TO_INSTALL+=("vscode")
            ;;
        -w | --warp)
            TOOLS_TO_INSTALL+=("warp")
            ;;
        -p | --postman)
            TOOLS_TO_INSTALL+=("postman")
            ;;
        --vscode-extensions)
            INSTALL_EXTENSIONS=1
            ;;
        --set-warp-default-terminal)
            SET_WARP_DEFAULT_TERMINAL=1
            ;;
        *)
            echo "Unknown option: $arg"
            echo "Usage: $0 [-a|--all] [-d|--docker] [-v|--vscode] [-w|--warp] [-p|--postman] [-g|--git] [--extensions] [--set-default-terminal]"
            cleanup
            exit 1
            ;;
        esac
    done
fi

# Install selected tools
for tool in "${TOOLS_TO_INSTALL[@]}"; do
    install_tool "$tool"
done

# Install VSCode extensions if requested
if [ "$INSTALL_EXTENSIONS" -eq 1 ]; then
    install_vscode_extensions
fi

# Clean up
cleanup

echo "Installation complete!"
