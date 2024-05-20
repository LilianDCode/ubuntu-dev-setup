#!/bin/sh

SUCCESS_INSTALLATION=1
EXIT_CODE=0

echo "Checking installed tools..."

command -v docker >/dev/null 2>&1 && echo "Docker installed ✅" || { echo "ERROR: docker not installed ❌"; SUCCESS_INSTALLATION=0; }
command -v code >/dev/null 2>&1 && echo "Code installed ✅" || { echo "ERROR: code not installed ❌"; SUCCESS_INSTALLATION=0; }
command -v warp-terminal >/dev/null 2>&1 && echo "Warp-terminal installed ✅" || { echo "ERROR: warp-terminal not installed ❌"; SUCCESS_INSTALLATION=0; }
command -v postman >/dev/null 2>&1 && echo "Postman installed ✅" || { echo "ERROR: postman not installed ❌"; SUCCESS_INSTALLATION=0; }

if [ "$SUCCESS_INSTALLATION" -eq 1 ]; then
    echo "✅ All tools are successfully installed!"
else
    EXIT_CODE=1
    echo "Error during installation process. ❌ Please check logs for more details."
fi

# Keep the container running
sleep infinity
