# starship
eval "$(starship init zsh)

# zsh plugins
source ~/.zsh/fast-syntax-highlighting/F-Sy-H.plugin.zsh
source ~/.zsh/completion.zsh

# Load completion config
source ~/.zsh/completion.zsh

# Initialize the completion system
autoload -Uz compinit

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=133
if [ 133 !=  ]; then
  compinit -i
else
  compinit -C -i
fi

# Enhanced form of menu completion called 'menu selection'
zmodload -i zsh/complist
