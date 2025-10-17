# dotfiles
## Pre-installation
### Linux
1. Install curl, git
   ```shell
   # Debian
   sudo apt update && sudo apt upgrade
   sudo apt install curl git
   ```

### macOS
1. Install Xcode Command Line Tools
   ```shell
   xcode-select --install
   ```
1. Install [Homebrew](https://brew.sh/) with `.pkg` installer or command
   ```shell
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

## Installation
1. Install [chezmoi](https://www.chezmoi.io/)
   ```shell
   # Linux
   sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
   # macOS
   brew install chezmoi
   ```
1. Initialize chezmoi
   ```shell
   chezmoi init --apply https://github.com/Nordkuma/dotfiles.git
   ```

## Post-installation (optional)
### Alacritty
1. Install [Alacritty](https://github.com/alacritty/alacritty/blob/master/INSTALL.md) by package manager or build from source

### Docker
1. Install [Docker Engine](https://docs.docker.com/engine/install/)

### Fonts
1. Download [HackGen](https://github.com/yuru7/HackGen/releases/latest), [Roboto](https://fonts.google.com/specimen/Roboto), [Noto Sans JP](https://fonts.google.com/noto/specimen/Noto+Sans+JP)
1. Unzip and install

### GPG for SSH
1. Generate GPG key
   ```shell
   gpg --full-generate-key --expert
   ```
   or import existing key
   ```shell
   gpg --import <keyfile>
   gpg --edit-key <user-id>
   gpg> trust
   ```
1. Get the keygrip of authentication subkey
   ```shell
   gpg --list-keys --with-keygrip
   ```
1. Add the keygrip to `~/.gnupg/sshcontrol`
   ```shell
   echo <keygrip> >> ~/.gnupg/sshcontrol
   ```
1. Check if the key is added
   ```shell
   ssh-add -l
   ```
1. Export public key
   ```shell
   gpg --export-ssh-key <user-id>
   ```
1. Test SSH connection to GitHub
   ```shell
   ssh -T git@github.com
   ```

### Python
1. Install [uv](https://docs.astral.sh/uv/getting-started/installation/)
1. Install [Ruff](https://docs.astral.sh/ruff/installation/), [ty](https://docs.astral.sh/ty/installation/) with uv

### Tailscale
1. Install [Tailscale](https://tailscale.com/download/) with command or from Mac App Store
1. Start Tailscale without using tailnet's DNS
   ```shell
   sudo tailscale up --accept-dns=false
   ```
