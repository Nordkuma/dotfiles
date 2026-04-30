# dotfiles
## Pre-installation
### Linux
1. Install curl, git
   ```shell
   # Debian/Ubuntu
   sudo apt update
   sudo apt install curl git
   ```

### macOS
1. Install Xcode Command Line Tools
   ```shell
   xcode-select --install
   ```
1. Install [Homebrew](https://brew.sh/)
   ```shell
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

## Installation
### Linux
1. Install and initialize [chezmoi](https://www.chezmoi.io/install/)
   ```shell
   sh -c "$(curl -fsLS https://get.chezmoi.io/lb)" -- init --apply Nordkuma
   ```

### macOS
1. Install chezmoi with Homebrew
   ```shell
   brew install chezmoi
   ```
1. Initialize chezmoi
   ```shell
   chezmoi init --apply Nordkuma
   ```

## Post-installation (optional)
### Container Engine
1. Install [Docker Engine](https://docs.docker.com/engine/install/) or [Podman](https://podman.io/docs/installation)

### eza
1. Install [eza](https://github.com/eza-community/eza/blob/main/INSTALL.md) on Linux
   ```shell
   # Debian/Ubuntu
   sudo mkdir -p /etc/apt/keyrings
   curl -fsSL https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
   echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
   sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
   sudo apt update
   sudo apt install -y eza
   ```

### Fonts
1. Download [HackGen](https://github.com/yuru7/HackGen/releases/latest), [Roboto](https://fonts.google.com/specimen/Roboto), [Noto Sans JP](https://fonts.google.com/noto/specimen/Noto+Sans+JP)
1. Unzip and install

### GPG for SSH
1. Generate a GPG key
   ```shell
   gpg --full-generate-key --expert
   ```
   or import an existing key
   ```shell
   gpg --import <keyfile>
   gpg --edit-key <user-id>
   gpg> trust
   ```
1. Get the keygrip of the authentication subkey
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
1. Install [Neovim](https://neovim.io/doc/install/) on Linux
   ```shell
   # Debian/Ubuntu
   case "$(uname -m)" in
     x86_64)  FILE="nvim-linux-x86_64.appimage" ;;
     aarch64) FILE="nvim-linux-arm64.appimage" ;;
     *) echo "Unsupported architecture: $(uname -m)"; exit 1 ;;
   esac
   curl -fLO "https://github.com/neovim/neovim/releases/latest/download/$FILE"
   sudo install -m 755 -o root "$FILE" /usr/local/bin/nvim
   rm "$FILE"
   ```
1. Install [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md), [ripgrep](https://github.com/BurntSushi/ripgrep) with Cargo
   ```shell
   cargo install --locked tree-sitter-cli
   cargo install ripgrep
   ```
1. Launch Neovim and install Tree-sitter parsers
   ```vim
   :TSInstall <language>
   ```
1. Install [mac-ime](https://github.com/Nordkuma/mac-ime) for macOS or [win-ime](https://github.com/Nordkuma/win-ime) for WSL

### Python
1. Install [uv](https://docs.astral.sh/uv/getting-started/installation/)
   ```shell
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```
1. Generate zsh completions
   ```shell
   uv generate-shell-completion zsh > ~/.config/zsh/completions/_uv
   uvx --generate-shell-completion zsh > ~/.config/zsh/completions/_uvx
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
   rustup completions zsh > ~/.config/zsh/completions/_rustup
   ln -s ~/.rustup/toolchains/$(rustup toolchain list | grep default | awk '{print $1}')/share/zsh/site-functions/_cargo ~/.config/zsh/completions/_cargo
   ```
1. Install build tools on Linux
   ```shell
   # Debian/Ubuntu
   sudo apt install build-essential clang
   ```
1. Install [cargo-update](https://github.com/nabijaczleweli/cargo-update) (optional)
   ```shell
   cargo install cargo-update
   ```

### Tailscale
1. Install [Tailscale](https://tailscale.com/download/) on Linux
   ```shell
   curl -fsSL https://tailscale.com/install.sh | sh
   ```
   or install from the [App Store](https://apps.apple.com/ca/app/tailscale/id1475387142) on macOS
1. Start Tailscale without using tailnet's DNS
   ```shell
   sudo tailscale up --accept-dns=false
   ```

### Terminal Emulator
1. Install [Alacritty](https://github.com/alacritty/alacritty/blob/master/INSTALL.md) or [Ghostty](https://ghostty.org/docs/install/binary)
