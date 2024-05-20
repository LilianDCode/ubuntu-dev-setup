# Ubuntu Development Setup Installer

This project provides a script to set up a development environment on Ubuntu. It supports multiple versions of Ubuntu and allows you to install a variety of tools interactively or in ci mode.

Whether you're setting up a new machine or just want to add some tools to your existing setup, this script makes the process easy and straightforward. Just run the script, select the tools you want to install, and let the installer handle the rest.

## Compatibility

| Ubuntu Version | Status |
| -------------- | ------ |
| Ubuntu 24.04   | ![Ubuntu 24.04](https://github.com/LilianDCode/ubuntu-setup/actions/workflows/ci.yml/badge.svg?branch=main&event=push&job=test-setup&matrix=os=ubuntu-24.04) |
| Ubuntu 22.04   | ![Ubuntu 22.04](https://github.com/LilianDCode/ubuntu-setup/actions/workflows/ci.yml/badge.svg?branch=main&event=push&job=test-setup&matrix=os=ubuntu-22.04) |
| Ubuntu 20.04   | ![Ubuntu 20.04](https://github.com/LilianDCode/ubuntu-setup/actions/workflows/ci.yml/badge.svg?branch=main&event=push&job=test-setup&matrix=os=ubuntu-20.04) |

## Usage

### Interactive Mode

Run the setup script with a single command:

```sh
curl -fsSL https://raw.githubusercontent.com/LilianDCode/ubuntu-dev-setup/main/setup.sh | sudo bash
```

Follow the instructions in the script to select the tools you want to install. Use tab to select/unselect a tool. If you choose to install Warp, you will be asked if you want to set it as the default terminal.

### Non-Interactive Mode

Run the setup script with options for non-interactive mode:

| Option | Command |
| --- | --- |
| Install all tools | ```sudo bash -s -- --all ``` |
| Install Docker only | ```sudo bash -s -- --docker ``` |
| Install Visual Studio Code only | ```sudo bash -s -- --vscode ``` |
| Install Visual Studio Code Extensions only | ```sudo bash -s -- --vscode-extensions ``` |
| Install Warp Terminal only | ```sudo bash -s -- --warp ``` |
| Install Warp Terminal and set it as the default terminal | ```sudo bash -s -- --warp --set-warp-default ``` |
| Install Postman only | ```sudo bash -s -- --postman ``` |

### Help

For help:

```sh
curl -fsSL https://raw.githubusercontent.com/LilianDCode/ubuntu-dev-setup/main/setup.sh | sudo bash -s -- --help
```

## Tools Included

| Tool | Description |  |
| --- | --- | --- |
| <a href="https://www.docker.com/" target="_blank">Docker</a> | Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. | <img src="https://blog.lecacheur.com/wp-content/uploads/2014/10/docker.png" width="200"> |
| <a href="https://code.visualstudio.com/" target="_blank">Visual Studio Code</a> | Visual Studio Code is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS, and Linux. | <img src="https://cdn.neowin.com/news/images/uploaded/2023/07/1688749943_vscode_story.jpg" width="200"> |
| <a href="https://www.warp.dev/" target="_blank">Warp Terminal</a> | Warp is a blazingly fast, Rust-based terminal reimagined from the ground up to work like a modern app. | <img src="https://assets-global.website-files.com/64b7506ad75bbfcf43a51e90/64c970e9f2b2687e46074f4e_6427349e1bf2f0846cf732ac_blogCover.png" width="200"> |
| <a href="https://www.postman.com/" target="_blank">Postman</a> | Postman is a popular API client that makes it easy for developers to create, share, test and document APIs. | <img src="https://assets.getpostman.com/common-share/postman-logo-stacked.svg" width="200"> |

### VSCode extensions

In addition to the tools mentioned above, there are several Visual Studio Code extensions that can enhance your development experience. Here are some of the most useful ones that can be installed with the --vscode-extensions flag:

| Image | Extension | Description |
| --- | --- | --- |
| <img src="https://davidanson.gallerycdn.vsassets.io/extensions/davidanson/vscode-markdownlint/0.55.0/1713329425871/Microsoft.VisualStudio.Services.Icons.Default" width="20px"> | [Markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) | Lints Markdown files to enforce standards and catch errors. |
| <img src="https://yzhang.gallerycdn.vsassets.io/extensions/yzhang/markdown-all-in-one/3.6.2/1705324444519/Microsoft.VisualStudio.Services.Icons.Default" width="20px"> | [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) | All you need for Markdown (keyboard shortcuts, table of contents, auto preview and more). |
| <img src="https://github.gallerycdn.vsassets.io/extensions/github/copilot/1.194.886/1716168894754/Microsoft.VisualStudio.Services.Icons.Default" width="20px"> | [GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot) | GitHub Copilot is an AI-powered code assistant. |
| <img src="https://github.gallerycdn.vsassets.io/extensions/github/copilot-chat/0.16.2024051702/1715969194263/Microsoft.VisualStudio.Services.Icons.Default" width="20px"> | [GitHub Copilot Chat](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat) | Allows you to chat with GitHub Copilot. |
| <img src="https://ms-vscode-remote.gallerycdn.vsassets.io/extensions/ms-vscode-remote/remote-containers/0.366.0/1715895473555/Microsoft.VisualStudio.Services.Icons.Default" width="20px"> | [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) | Allows you to use a Docker container as a full-featured development environment. |
| <img src="https://ms-vscode-remote.gallerycdn.vsassets.io/extensions/ms-vscode-remote/remote-ssh/0.112.2024051615/1715872815013/Microsoft.VisualStudio.Services.Icons.Default" width="20px"> | [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) | Allows you to use any remote machine with a SSH server as a development environment. |
| <img src="https://ms-vscode.gallerycdn.vsassets.io/extensions/ms-vscode/remote-explorer/0.5.2024051509/1715766079301/Microsoft.VisualStudio.Services.Icons.Default" width="20px"> | [Remote Explorer](https://marketplace.visualstudio.com/items?itemName=ms-vscode.remote-explorer) | An explorer for VS Code Remote Development. |
| <img src="https://ms-vsliveshare.gallerycdn.vsassets.io/extensions/ms-vsliveshare/vsliveshare/1.0.5918/1709669798447/Microsoft.VisualStudio.Services.Icons.Default" width="20px"> | [Live Share](https://marketplace.visualstudio.com/items?itemName=ms-vsliveshare.vsliveshare) | Real-time collaborative development from the comfort of your favorite tools. |
| <img src="https://pshaddel.gallerycdn.vsassets.io/extensions/pshaddel/conventional-branch/0.1.1/1687871101817/Microsoft.VisualStudio.Services.Icons.Default" width="20px"> | [Conventional Branch](https://marketplace.visualstudio.com/items?itemName=pshaddel.conventional-branch) | Helps create branch names based on the Conventional Commits standard. |
| <img src="https://vivaxy.gallerycdn.vsassets.io/extensions/vivaxy/vscode-conventional-commits/1.25.0/1672399638528/Microsoft.VisualStudio.Services.Icons.Default" width="20px"> | [Conventional Commits](https://marketplace.visualstudio.com/items?itemName=vivaxy.vscode-conventional-commits) | Helps write commit messages following the Conventional Commits specification. |
| <img src="https://streetsidesoftware.gallerycdn.vsassets.io/extensions/streetsidesoftware/code-spell-checker/3.0.1/1694424431035/Microsoft.VisualStudio.Services.Icons.Default" width="20px"> | [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) | A basic spell checker that works well with camelCase code. |

### Additional packages

In order to ensure the smooth running of the setup script and the installed tools, some additional packages are checked for and installed if not already present on your system. These include `curl` and `wget` for data transfer, `gpg` for secure communication, `lsb-release` for providing Linux Standard Base and distribution-specific information, and `fzf` for creating user-friendly dialogs in interactive mode. Here's a brief overview of these packages:

| Package | Description |
| --- | --- |
| curl | A command-line tool for transferring data with URL syntax |
| wget | A free utility for non-interactive download of files from the web |
| gpg | GNU Privacy Guard, a free implementation of the OpenPGP standard |
| lsb-release | Provides certain LSB (Linux Standard Base) and distribution-specific information |
| fzf (interactive mode only) | A general-purpose command-line fuzzy finder |

## Development Mode

You can switch between production and development modes using the `DEV_MODE` environment variable. 

In development mode, the code is used directly from the source. In production mode, the script is fetched from GitHub and executed.

To switch modes, you need to rebuild the container with the new `DEV_MODE` environment variable. Here's how you can do it:

To switch to development mode:

```bash
DEV_MODE=dev docker-compose build # default
```

To switch to production mode:

```bash
DEV_MODE=prod docker-compose build
```

## Versioning

This project uses [semantic-release](https://semantic-release.gitbook.io/semantic-release/) to manage versioning. The current version of the project can be found in the `VERSION` file.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
