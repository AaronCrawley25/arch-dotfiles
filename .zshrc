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
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Add hidden files to tab completion
unsetopt LIST_BEEP # Disable the tab complete beep

############ ALIASES ############
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias grep='grep --color=auto'
alias cd..='cd ..'
alias cls="printf '\033[2J\033[3J\033[1;1H'" # Clears the scrollback buffer too!
alias configit='/usr/bin/git --git-dir=$HOME/.configit/ --work-tree=$HOME' # Allows managing of dotfiles with git

############ KEYBINDS ############
bindkey '\e[H'  beginning-of-line # Home Key
bindkey '\e[F'  end-of-line # End Key
bindkey '\e[3~' delete-char # Delete Key
bindkey "^[[1;5C" forward-word # Ctrl Right
bindkey "^[[1;5D" backward-word # Ctrl Left

############ SYNTAX HIGHLIGHTING ############
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

############ AUTOSUGGESIONS ############
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion) # Add tab completion to autosuggest
ZSH_AUTOSUGGEST_HISTORY_IGNORE="(cd *)|(ls *)" # Using history here sucks
