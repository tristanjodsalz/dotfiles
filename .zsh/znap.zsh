# Download Znap, if it's not there yet.
[[ -r ~/.znap-repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap-repos/znap
source ~/.znap-repos/znap/znap.zsh  # Start Znap

# Starship
znap eval starship 'starship init zsh --print-full-init'
znap prompt

# Plugins
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions

znap source ohmyzsh/ohmyzsh plugins/sudo
znap source ohmyzsh/ohmyzsh plugins/command-not-found

# Completions
znap source zsh-users/zsh-completions


# other stuff
znap eval brew-shellenv '/home/linuxbrew/.linuxbrew/bin/brew shellenv'
znap eval zoxide 'zoxide init zsh --cmd cd'


if [ -f ~/.zsh/config/full ]; then
    znap source ohmyzsh/ohmyzsh plugins/mise
    znap source ohmyzsh/ohmyzsh plugins/ssh-agent
    znap source ohmyzsh/ohmyzsh plugins/rust

    znap eval step_ssh_completions ~/.zsh/step_ssh_completions.zsh
fi
