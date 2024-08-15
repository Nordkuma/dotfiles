# dotfiles
## Pre-installation
### Linux
1. Install curl, git
   ```bash
   # Ubuntu
   sudo apt update && sudo apt upgrade
   sudo apt install curl git
   ```

### macOS
1. Install Xcode Command Line Tools
   ```bash
   xcode-select --install
   ```
1. Install [Homebrew](https://brew.sh/) with `.pkg` installer or command line

## Installation
1. Install [chezmoi](https://www.chezmoi.io/)
   ```bash
   # Ubuntu
   sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
   # macOS
   brew install chezmoi
   ```
1. Initialize chezmoi
   ```bash
   chezmoi init --apply https://github.com/Nordkuma/dotfiles.git
   ```

## Post-installation (optional)
### Alacritty
1. Install [Alacritty](https://github.com/alacritty/alacritty/blob/master/INSTALL.md) by package manager or build from source

### Docker
1. Install [Docker Engine](https://docs.docker.com/engine/install/) depending on your platform

### Fonts
1. Download [Roboto](https://fonts.google.com/specimen/Roboto), [Noto Sans JP](https://fonts.google.com/noto/specimen/Noto+Sans+JP), [HackGen](https://github.com/yuru7/HackGen/releases/latest)
1. Unzip and install with GUI

### GPG for SSH
1. Generate GPG key
   ```bash
   gpg --full-generate-key --expert
   ```
   or import existing key
   ```bash
   gpg --import <keyfile>
   gpg --edit-key <user-id>
   gpg> trust
   ```
1. Get the keygrip of authentication subkey
   ```bash
   gpg --list-keys --with-keygrip
   ```
1. Add the keygrip to `~/.gnupg/sshcontrol`
   ```bash
   echo <keygrip> >> ~/.gnupg/sshcontrol
   ```
1. Check if the key is added
   ```bash
   ssh-add -l
   ```
1. Export public key
   ```bash
   gpg --export-ssh-key <user-id>
   ```
1. Test SSH connection to GitHub
   ```bash
   ssh -T git@github.com
   ```

### Tailscale
1. Install [Tailscale](https://tailscale.com/download/) with command line or Mac App Store
1. Start Tailscale
   ```bash
   sudo tailscale up --accept-dns=false
   ```
