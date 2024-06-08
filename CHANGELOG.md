## [1.5.1](https://github.com/LilianDCode/ubuntu-dev-setup/compare/1.5.0...1.5.1) (2024-06-08)


### Bug Fixes

* Dockerfile prod could not execute setup as sudo fixed ([630751b](https://github.com/LilianDCode/ubuntu-dev-setup/commit/630751b1afbaf1a8931afd6bb56681fab6fa1ba5))

# [1.5.0](https://github.com/LilianDCode/ubuntu-dev-setup/compare/1.4.0...1.5.0) (2024-05-27)


### Features

* Ansible is now installed suing official pipx method ([6083d1b](https://github.com/LilianDCode/ubuntu-dev-setup/commit/6083d1b36d465314c5d26c7a29157883a3f3dfc1))

# [1.4.0](https://github.com/LilianDCode/ubuntu-dev-setup/compare/1.3.0...1.4.0) (2024-05-26)


### Bug Fixes

* Using quotes to access variables now ([9dab714](https://github.com/LilianDCode/ubuntu-dev-setup/commit/9dab714136ab334d5e66fc912f0953e7f9823845))


### Features

* Switch to ansible instead of raw shell scripts to install tools ([094e506](https://github.com/LilianDCode/ubuntu-dev-setup/commit/094e5065e4b6642a98ceedf1d0ba47def135c9e2))

# [1.3.0](https://github.com/LilianDCode/ubuntu-dev-setup/compare/1.2.0...1.3.0) (2024-05-20)


### Bug Fixes

* Fix $USER not as text ([6891340](https://github.com/LilianDCode/ubuntu-dev-setup/commit/6891340f8fd165bd039849c2cdd6cf07e834a0d4))


### Features

* Predifined VSCode extensions can now be installed using flag -e or --vscode-extensions ([7189cef](https://github.com/LilianDCode/ubuntu-dev-setup/commit/7189cefd1388a24e5485586227b34f5ea215b535))

# [1.2.0](https://github.com/LilianDCode/ubuntu-dev-setup/compare/1.1.0...1.2.0) (2024-05-20)


### Features

* Preselected vscode extensions added to the installation process ([e235123](https://github.com/LilianDCode/ubuntu-dev-setup/commit/e235123ad460745edb5f39cff4979639846b5e59))

# [1.1.0](https://github.com/LilianDCode/ubuntu-setup/compare/1.0.0...1.1.0) (2024-05-20)


### Features

* Welcome message added at the beginning of the script ([1125212](https://github.com/LilianDCode/ubuntu-setup/commit/1125212103fb6fc97e91d94f35309890cf2f36dc))

# 1.0.0 (2024-05-20)


### Bug Fixes

* Fix docker prod execute script without privileged ([bf059b5](https://github.com/LilianDCode/ubuntu-setup/commit/bf059b52ade33dafc3c7a1c5008bfa3d6855e70e))


### Features

* Add check installation script ([b35f765](https://github.com/LilianDCode/ubuntu-setup/commit/b35f765475f49eec6993d60e959ca90768036e60))
* Add Docker entrypoint ([177d16f](https://github.com/LilianDCode/ubuntu-setup/commit/177d16fe32b446e5dbb450d861a7e57d6a6f7e52))
* Add Postman to the list of tools to be installed ([36f9812](https://github.com/LilianDCode/ubuntu-setup/commit/36f98120fb16fa7002cbffc0a4fa7e107ae95fdd))
* Adding semantic release for auto versioning ([04e7454](https://github.com/LilianDCode/ubuntu-setup/commit/04e7454942b970d21d09eb95050d8c8cb4494a96))
* Adding user choice cancel handler in interactive mode ([8e099b6](https://github.com/LilianDCode/ubuntu-setup/commit/8e099b67f810833e411608885ff328a977971c12))
* Change docker to use watch and switch between dev and prod mode ([3b8f957](https://github.com/LilianDCode/ubuntu-setup/commit/3b8f957810fa65270440bb6869bddf35ac282875))
* Change to use fzf ([a0a4994](https://github.com/LilianDCode/ubuntu-setup/commit/a0a499465041c6fdff93367954987f012f869a67))
* Check cancel removed during interactive mode ([3a56b63](https://github.com/LilianDCode/ubuntu-setup/commit/3a56b63578edc928b3c749afa0848e75b26c467d))
* Create setup script ([4edc1ba](https://github.com/LilianDCode/ubuntu-setup/commit/4edc1baafd7577bcf14e701a1211269790c7f91f))
