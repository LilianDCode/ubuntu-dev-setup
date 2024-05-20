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
| <a href="https://www.docker.com/" target="_blank">Docker-CE and Docker Compose</a> | Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. | <img src="https://blog.lecacheur.com/wp-content/uploads/2014/10/docker.png" width="200"> |
| <a href="https://code.visualstudio.com/" target="_blank">Visual Studio Code</a> | Visual Studio Code is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS, and Linux. | <img src="https://cdn.neowin.com/news/images/uploaded/2023/07/1688749943_vscode_story.jpg" width="200"> |
| <a href="https://www.warp.dev/" target="_blank">Warp Terminal</a> | Warp is a blazingly fast, Rust-based terminal reimagined from the ground up to work like a modern app. | <img src="https://assets-global.website-files.com/64b7506ad75bbfcf43a51e90/64c970e9f2b2687e46074f4e_6427349e1bf2f0846cf732ac_blogCover.png" width="200"> |
| <a href="https://www.postman.com/" target="_blank">Postman</a> | Postman is a popular API client that makes it easy for developers to create, share, test and document APIs. | <img src="https://assets.getpostman.com/common-share/postman-logo-stacked.svg" width="200"> |

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
