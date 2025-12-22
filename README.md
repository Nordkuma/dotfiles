# dotfiles
## Pre-installation
### Linux
1. Install curl, git
   ```shell
   # Debian
   sudo apt update
   sudo apt install curl git
   ```

### macOS
1. Install Xcode Command Line Tools
   ```shell
   xcode-select --install
   ```
1. Install [Homebrew](https://brew.sh/) with installer or command
   ```shell
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

## Installation
1. Install [chezmoi](https://www.chezmoi.io/install/) with command or Homebrew
   ```shell
   sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
   # or
   brew install chezmoi
   ```
1. Initialize chezmoi
   ```shell
   chezmoi init --apply https://github.com/Nordkuma/dotfiles.git
   ```

## Post-installation (optional)
### Alacritty
1. Install [Alacritty](https://github.com/alacritty/alacritty/blob/master/INSTALL.md) by building from source or with Homebrew
   ```shell
   brew install alacritty
   ```

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

### Neovim
1. Install [Neovim](https://neovim.io/doc/install/) with Homebrew
   ```shell
   brew install neovim
   ```
   or by downloading AppImage
   ```shell
   # x86
   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
   chmod +x nvim-linux-x86_64.appimage
   sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

   # ARM
   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.appimage
   chmod +x nvim-linux-arm64.appimage
   sudo mv nvim-linux-arm64.appimage /usr/local/bin/nvim

   sudo chown root:root /usr/local/bin/nvim
   ```
1. Install [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) with Cargo
   ```shell
   cargo install --locked tree-sitter-cli
   ```
1. Install [macime](https://github.com/riodelphino/macime) for macOS or [zenhan](https://github.com/iuchim/zenhan) for WSL manually
1. Launch Neovim and install Tree-sitter parsers
   ```shell
   nvim
   :TSInstall <language>
   ```

### Python
1. Install [uv](https://docs.astral.sh/uv/getting-started/installation/)
   ```shell
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```
1. Install [Ruff](https://docs.astral.sh/ruff/installation/), [ty](https://docs.astral.sh/ty/installation/) with uv
   ```shell
   uv tool install ruff@latest
   uv tool install ty@latest
   ```

### Rust
1. Install [Rust](https://rust-lang.org/tools/install/)
   ```shell
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```
1. Generate zsh completions
   ```shell
   rustup completions zsh > ~/.zsh/completion/_rustup
   ln -s ~/.rustup/toolchains/{toolchain-name}/share/zsh/site-functions/_cargo ~/.zsh/completion/_cargo
   ```
1. Install build tools
   ```shell
   # Debian
   sudo apt install build-essential clang
   ```
1. Install [cargo-update](https://github.com/nabijaczleweli/cargo-update) (optional)
   ```shell
   cargo install cargo-update
   ```

### Tailscale
1. Install [Tailscale](https://tailscale.com/download/) from App Store or with command
   ```shell
   curl -fsSL https://tailscale.com/install.sh | sh
   ```
1. Start Tailscale without using tailnet's DNS
   ```shell
   sudo tailscale up --accept-dns=false
   ```
