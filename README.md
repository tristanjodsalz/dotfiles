# tristanjockel's dotfiles

## Quickstart

Install needed dependencies:

```bash
sudo apt install -y git stow zsh
sudo curl -sS https://starship.rs/install.sh | sudo sh
```

Clone the repository:

```bash
git clone https://github.com/Minecrafter5K/dotfiles.git
```

Link all files:

```bash
cd dotfiles
stow .
```

Some setup:

```zsh
chsh -s $(which zsh)
sudo locale-gen de_DE.UTF-8
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
zsh
brew install zoxide bat bc jq coreutils gawk
```

## brew for sudo/root

To use brew commands with sudo/root you need to add them to PATH:

```zsh
sudo visudo
```

After `Defaults  secure_path` add `:/home/linuxbrew/.linuxbrew/bin`

## debug zsh startup timing

```zsh
time ZSH_DEBUGRC=1 zsh -i -c exit
```
