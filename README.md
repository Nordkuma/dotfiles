# dotfiles
## Requirements
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
   chezmoi init --apply https://github.com/srkm1a1/dotfiles.git
   ```

## Post Installation (Optional)
### Alacritty
1. Install [Alacritty](https://github.com/alacritty/alacritty/blob/master/INSTALL.md) by package manager or build from source

### Docker
1. Install [Docker Engine](https://docs.docker.com/engine/install/) depending on your platform

### Fonts
1. Download [Roboto](https://fonts.google.com/specimen/Roboto), [Noto Sans JP](https://fonts.google.com/noto/specimen/Noto+Sans+JP), [HackGen](https://github.com/yuru7/HackGen/releases/latest)
2. Unzip and install with GUI

### GitHub
1. Generate SSH key
   ```bash
   mkdir ~/.ssh
   cd ~/.ssh
   ssh-keygen -t ed25519 -f id_github_ed25519
   cat ~/.ssh/id_github_ed25519.pub
   ```
1. Add SSH key to GitHub [SSH and GPG keys](https://github.com/settings/keys)
1. Edit `~/.ssh/config` and add following lines:
   ```bash
   Host github.com
     HostName github.com
     User git
     IdentityFile ~/.ssh/id_github_ed25519
   ```
1. Confirm access to GitHub
   ```bash
   ssh -T git@github.com
   ```

### Tailscale
1. Install [Tailscale](https://tailscale.com/download/) with command line or Mac App Store
1. Start Tailscale
   ```bash
   sudo tailscale up --accept-dns=false
   ```
