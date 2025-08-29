# WSL Setup

## Prerequisites

- WSL2 enabled (Check on MSDN on how to verify/enable)
- Administrative privileges

## Step-by-Step

1. From PowerShell, run:
    
    ```powershell
    wsl --install -d FedoraLinux-42
    ```
    
2. **First-time Setup:**After installation completes, Fedora will start automatically. Create your username and password when prompted. 
    
    ```bash
    sudo dnf update && sudo dnf upgrade
    ```
    
3. **Install Modern Shell:** Setup a better terminal experience:
    
    ```bash
    # Install Zsh and zoxide
    sudo dnf install zsh zoxide
    
    # Change the default shell
    chsh -s $(which zsh)
    
    # Create then cd to .zsh dir and clone zsh plugins
     git clone https://github.com/zsh-users/zsh-autosuggestions
     git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
     git clone https://github.com/zsh-users/zsh-history-substring-search
     
     git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
     cd zsh-syntax-highlighting/themes/
     cp -v catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/zsh-syntax-highlighting/
    
    # Install Starship prompt
    # Then copy the starship.toml from my my GitHub
    curl -sS https://starship.rs/install.sh | sh
    mkdir -p ~/.config && touch ~/.config/starship.toml
    
    # Copy the code for zsh config
    ───────┬─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
           │ File: .zshrc
    ───────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
       1   │ # History
       2   │ HISTFILE=~/.zsh/.zsh_history
       3   │ HISTSIZE=10000
       4   │ SAVEHIST=10000
       5   │ setopt HIST_IGNORE_DUPS
       6   │ setopt HIST_IGNORE_ALL_DUPS
       7   │ setopt HIST_FIND_NO_DUPS
       8   │ setopt APPEND_HISTORY
       9   │
      10   │ setopt notify
      11   │ setopt AUTO_CD
      12   │ unsetopt beep
      13   │
      14   │ # Keybinds
      15   │ # Run cat -v to observe key codes to use for up and down arrow.
      16   │ bindkey '^[[A' history-substring-search-up
      17   │ bindkey '^[[B' history-substring-search-down
      18   │
      19   │ eval "$(zoxide init zsh --cmd cd)"
      20   │
      21   │ # The following lines were added by compinstall
      22   │ zstyle :compinstall filename '/home/rca_fedora/.zshrc'
      23   │
      24   │ autoload -Uz compinit
      25   │ compinit
      26   │ # End of lines added by compinstall
      27   │
      28   │ eval "$(starship init zsh)"
      29   │ export FZF_DEFAULT_OPTS=" \
      30   │ --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
      31   │ --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
      32   │ --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
      33   │ --color=selected-bg:#45475A \
      34   │ --color=border:#313244,label:#CDD6F4"
      35   │
      36   │ # Source files
      37   │ source ~/.zsh/.zsh_aliases
      38   │ source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
      39   │ source ~/.zsh/zsh-syntax-highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh
      40   │ source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      41   │ source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
    ───────┴─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    ```
    
4. **Install Modern CLI Tools and Core Tools**
    
    ```bash
    sudo dnf install git bat neovim tldr fzf tmux gh fd-find wget
    
    sudo dnf copr enable atim/lazygit -y
    sudo dnf install lazygit
    
    # cd to .zsh dir and create the file
    ───────┬─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
           │ File: .zsh/.zsh_aliases
    ───────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
       1   │ # Navigation
       2   │ alias cd..='cd ..'
       3   │ alias ..='cd ..'
       4   │ alias ...='cd ../..'
       5   │
       6   │ # Development
       7   │ alias vim='nvim'
       8   │ alias lg='lazygit'
       9   │ alias cat='bat'
      10   │ alias grep='rg'
      11   │ alias find='fd'
      12   │
      13   │ # Functions for common tasks
      14   │ mkcd() { mkdir -p "$1" && cd "$1"; }
    ```
    
5. Configure the tools

       https://github.com/catppuccin/bat/tree/main?tab=readme-ov-file

```bash
# to make man pages use batr
# appent this line to zshrc 
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
```

https://github.com/catppuccin/lazygit/tree/main?tab=readme-ov-file

```yaml
───────┬────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
       │ File: /home/rca_fedora/.config/lazygit/config.yml
───────┼────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ os:
   2   │   editPreset: 'vscode'
   3   │
   4   │ git:
   5   │   branchPrefix: 'feature/rca/'
   6   │
   7   │ gui:
   8   │   theme:
   9   │   activeBorderColor:
  10   │     - '#cba6f7'
  11   │     - bold
  12   │   inactiveBorderColor:
  13   │     - '#a6adc8'
  14   │   optionsTextColor:
  15   │     - '#89b4fa'
  16   │   selectedLineBgColor:
  17   │     - '#313244'
  18   │   cherryPickedCommitBgColor:
  19   │     - '#45475a'
  20   │   cherryPickedCommitFgColor:
  21   │     - '#cba6f7'
  22   │   unstagedChangesColor:
  23   │     - '#f38ba8'
  24   │   defaultFgColor:
  25   │     - '#cdd6f4'
  26   │   searchingActiveBorderColor:
  27   │     - '#f9e2af'
  28   │
  29   │ authorColors:
  30   │   '*': '#b4befe'
```

https://docs.github.com/en/get-started/git-basics/set-up-git

```bash
# Configure Git
git config --global user.name "rca"
git config --global user.email "rca@hafniabw.com"

# Configure GitHub CLI
gh auth login
# Follow the interactive prompts to authenticate

# Install copilot in cli
gh extension install github/gh-copilot

# To update the extension
gh extension upgrade gh-copilot

# To have an alias ghcs and ghce
echo 'eval "$(gh copilot alias -- zsh)"' >> ~/.zshrc
```

https://github.com/Schniz/fnm?tab=readme-ov-file#shell-setup

```bash
curl -fsSL https://fnm.vercel.app/install | bash

# Add fnm to shell
eval "$(fnm env --use-on-cd --shell zsh)"

# Reload shell configuration
source ~/.zshrc
```

https://yazi-rs.github.io/docs/installation

```bash
# Install rust tool
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# post install
rustup update

# Install dependencies first
sudo dnf install jq ImageMagick
cargo install resvg

# Installation
cargo install --locked yazi-fm yazi-cli

# Catppucin theme
https://github.com/catppuccin/yazi
```

<aside>
💡

Check my GitHub repo for the dotfiles configuration for more info. Note that we are using GNU stow.  Read for refresher: 

</aside>
