# Ubuntu Setup Script

This repository contains a script to set up a base Ubuntu environment with Docker, Visual Studio Code, and Warp terminal.

## Compatibility

| Ubuntu Version | Status |
| -------------- | ------ |
| Ubuntu 20.04   | ![Ubuntu 20.04](https://github.com/LilianDCode/ubuntu-setup/actions/workflows/ci.yml/badge.svg?branch=main&event=push&job=test-setup&matrix=os=ubuntu-20.04) |
| Ubuntu 22.04   | ![Ubuntu 22.04](https://github.com/LilianDCode/ubuntu-setup/actions/workflows/ci.yml/badge.svg?branch=main&event=push&job=test-setup&matrix=os=ubuntu-22.04) |
| Ubuntu 24.04   | ![Ubuntu 24.04](https://github.com/LilianDCode/ubuntu-setup/actions/workflows/ci.yml/badge.svg?branch=main&event=push&job=test-setup&matrix=os=ubuntu-24.04) |

## Usage

### Interactive Mode

Run the setup script with a single command:

```sh
curl -fsSL https://raw.githubusercontent.com/LilianDCode/ubuntu-setup/main/setup.sh | sudo bash
```

Follow the instructions in the script to select the tools you want to install. If you choose to install Warp, you will be asked if you want to set it as the default terminal.

### Non-Interactive Mode

Run the setup script with options for non-interactive mode:

| Option | Command |
| --- | --- |
| Install all tools | ```sudo bash -s -- --all ``` |
| Install Docker only | ```sudo bash -s -- --docker ``` |
| Install Visual Studio Code only | ```sudo bash -s -- --vscode ``` |
| Install Warp Terminal only | ```sudo bash -s -- --warp ``` |
| Install Warp Terminal and set it as the default terminal | ```sudo bash -s -- --warp --set-warp-default ``` |

### Help

For help:

```sh
curl -fsSL https://raw.githubusercontent.com/LilianDCode/ubuntu-setup/main/setup.sh | sudo bash -s -- --help
```

## Tools Included

| Tool | Description | Image |
| --- | --- | --- |
| <a href="https://www.docker.com/" target="_blank">Docker-CE and Docker Compose</a> | Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. | <img src="https://blog.lecacheur.com/wp-content/uploads/2014/10/docker.png" width="200"> |
| <a href="https://code.visualstudio.com/" target="_blank">Visual Studio Code</a> | Visual Studio Code is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS, and Linux. | <img src="https://code.visualstudio.com/assets/home/home-screenshot-linux.png" width="200"> |
| <a href="https://www.warp.dev/" target="_blank">Warp Terminal</a> | Warp is a blazingly fast, Rust-based terminal reimagined from the ground up to work like a modern app. | <img src="https://assets-global.website-files.com/64b6f3636f598299028e8577/65d5db665ae2b6b691e54ac6_modern-editing%402x.webp" width="200"> |

### Additional packages

In order to ensure the smooth running of the setup script and the installed tools, some additional packages are checked for and installed if not already present on your system. These include `curl` and `wget` for data transfer, `gpg` for secure communication, `lsb-release` for providing Linux Standard Base and distribution-specific information, and `whiptail` for creating user-friendly dialogs in interactive mode. Here's a brief overview of these packages:

| Package | Description |
| --- | --- |
| curl | A command-line tool for transferring data with URL syntax |
| wget | A free utility for non-interactive download of files from the web |
| gpg | GNU Privacy Guard, a free implementation of the OpenPGP standard |
| lsb-release | Provides certain LSB (Linux Standard Base) and distribution-specific information |
| whiptail (interactive mode only) | A friendly tool for creating dialogs from shell scripts |

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
