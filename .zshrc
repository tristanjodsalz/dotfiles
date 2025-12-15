# --- TIMING ---
if [[ -n "$ZSH_DEBUGRC" ]]; then
  zmodload zsh/zprof
fi
# --- TIMING ---

mkdir -p /home/tristanjockel/.cache/zsh/completions
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
fpath=($ZSH_CACHE_DIR/completions $fpath)
autoload -Uz compinit && compinit

[[ -f ~/.zsh/env.zsh ]] && source ~/.zsh/env.zsh
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/znap.zsh ]] && source ~/.zsh/znap.zsh

# keybinds
## ctrl/navigation
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^[[3~' delete-char

## zsh-autocomplete
bindkey -M menuselect '^M'              .accept-line
bindkey               '^I'              menu-select
bindkey               "$terminfo[kcbt]" menu-select
bindkey -M menuselect '^I'              menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char

# zsh-autosuggestion
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# --- TIMING ---
if [[ -n "$ZSH_DEBUGRC" ]]; then
  echo ""
  zprof
  echo ""
fi
# --- TIMING ---
