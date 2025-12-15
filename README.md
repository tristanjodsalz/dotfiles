# tristanjockel's dotfiles

## Quickstart

Install needed dependencies:

```bash
sudo pacman -S git stow zsh tmux sudo mise openssh eza zoxide bat
sudo curl -sS https://starship.rs/install.sh | sudo sh
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Clone the repository:

```bash
git clone https://github.com/tristanjodsalz/dotfiles.git .dotfiles
```

Link all files:

```bash
cd .dotfiles
stow .
```

Some setup:

```zsh
brew install zoxide bat
```

## AUR Packages

To install yay:

```zsh
sudo pacman -S --needed git base-devel
cd ~/.local/shared
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Some important applications:

```zsh
yay -S zen-browser-bin
```

```zsh
yay -S visual-studio-code-bin
```

```zsh
yay -S cider
```

## Desktop Stuff

```zsh
sudo pacman -S hyprland kitty quickshell ttf-jetbrains-mono-nerd
sudo pacman -S hypridle hyrplock hyprpaper hyprpolkitagent hyprpicker hyprlauncher
sudo yay -S bibata-cursor-theme-bin
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-hyprland nwg-displays gnome-keyring libsecret
sudo pacman -S easyeffects
```

## debug zsh startup timing

```zsh
time ZSH_DEBUGRC=1 zsh -i -c exit
```
