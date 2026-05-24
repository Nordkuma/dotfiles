# dotfiles
## Requirements
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
   mkdir -p $HOME/.local/bin
   sh -c "$(curl -fsLS https://get.chezmoi.io)" -- -b $HOME/.local/bin init --apply Nordkuma
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
