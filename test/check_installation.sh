#!/bin/sh

SUCCESS_INSTALLATION=1
EXIT_CODE=0

echo "Checking installed tools..."

command -v docker >/dev/null 2>&1 && echo "Docker installed ✅" || { echo "ERROR: docker not installed ❌"; SUCCESS_INSTALLATION=0; }
command -v code >/dev/null 2>&1 && echo "Code installed ✅" || { echo "ERROR: code not installed ❌"; SUCCESS_INSTALLATION=0; }
command -v warp-terminal >/dev/null 2>&1 && echo "Warp-terminal installed ✅" || { echo "ERROR: warp-terminal not installed ❌"; SUCCESS_INSTALLATION=0; }
command -v postman >/dev/null 2>&1 && echo "Postman installed ✅" || { echo "ERROR: postman not installed ❌"; SUCCESS_INSTALLATION=0; }

if [ "$SUCCESS_INSTALLATION" -eq 1 ]; then
    echo "All tools are successfully installed! ✅"
else
    EXIT_CODE=1
    echo "Error during installation process. ❌ Please check logs for more details."
fi

# Check VSCode extensions if insllation successful

if [ "$SUCCESS_INSTALLATION" -eq 1 ]; then
    EXTENSIONS_INSTALLED=1

    echo "Checking VSCode extensions..."

    EXTENSIONS=$(code --list-extensions)
    EXPECTED_EXTENSIONS="davidanson.vscode-markdownlint github.copilot github.copilot-chat ms-vscode-remote.remote-containers ms-vscode-remote.remote-ssh ms-vscode.remote-explorer ms-vsliveshare.vsliveshare pshaddel.conventional-branch streetsidesoftware.code-spell-checker vivaxy.vscode-conventional-commits yzhang.markdown-all-in-one"

    for EXTENSION in $EXPECTED_EXTENSIONS; do
        if ! echo "$EXTENSIONS" | grep -q "$EXTENSION"; then
            echo "VS Code extension $EXTENSION not installed correctly. ❌"
            EXTENSIONS_INSTALLED=0
        else
            echo "VS Code extension $EXTENSION installed ✅"
        fi
    done

    if [ "$EXTENSIONS_INSTALLED" -eq 1 ]; then
        echo "All VSCode extensions are successfully installed! ✅"
    else
        EXIT_CODE=1
        echo "Error during installation of vscode extensions. ❌ Please check logs for more details."
    fi
fi

# Keep the container running
sleep infinity
