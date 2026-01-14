#
#            _              
#           | |             
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ | | | | | | (__ 
# (_/___|___|_| |_|_|  \___|
#
#   File: .zshrc
#   Author: Aaron Crawley    
#                
                          
# Enable oh-my-posh prompt
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.omp.json)"

############ HISTORY ############
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000 

############ TAB COMPLETION ############
autoload -Uz compinit
zstyle ':completion:*' menu select # Enable menu
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Coloured menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case insensitive completion
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Add hidden files to tab completion
unsetopt LIST_BEEP # Disable the tab complete beep

############ ALIASES ############
alias ls='ls --color=auto --group-directories-first'
alias la='ls -a'
alias ll='ls -lah'
alias lr='ls -lRh'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias cd..='cd ..'
alias cls="printf '\033[2J\033[3J\033[1;1H'" # Clears the scrollback buffer too!
alias configit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # Allows managing of dotfiles with git
alias ssh="kitten ssh" # SSH doesn't work with kitty by default, so we doin' this instead
alias k='kubectl'
alias kns='kubens'
alias kat='bat -pp -l yaml'
alias less='bat -p --paging=always'
alias cat='bat -pp'
alias vim='nvim'
alias nv='nvim'
alias pyactivate='source ./.env/bin/activate'

############ FUNCTIONS  ############
lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

############ ENVIRONMENT ############
export GPG_TTY=$(tty)
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging=always'" # Use bat as man pager for syntax highlighting!
export MANROFFOPT="-c"
export USB="/run/media/$(whoami)"
export SUDO_EDITOR=/usr/bin/nvim
export KUBE_EDITOR=/usr/bin/nvim

############ KEYBINDS ############
bindkey '\e[H'  beginning-of-line # Home Key
bindkey '\e[F'  end-of-line # End Key
bindkey '\e[3~' delete-char # Delete Key
bindkey "^[[1;5C" forward-word # Ctrl Right
bindkey "^[[1;5D" backward-word # Ctrl Left

############ SYNTAX HIGHLIGHTING ############
# pacman -S zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

############ AUTOSUGGESIONS ############
# pacman -S zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(completion history) # Add tab completion to autosuggest
ZSH_AUTOSUGGEST_HISTORY_IGNORE="(cd *)|(ls *)" # Using history here sucks

############ AUTOSUGGESIONS ############
# git clone https://github.com/jirutka/zsh-shift-select ~/.local/share/zsh/plugins/zsh-shift-select
source ~/.local/share/zsh/plugins/zsh-shift-select/zsh-shift-select.plugin.zsh
