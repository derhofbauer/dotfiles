# Profile ZSH startup
if [ -n "${ZSH_DEBUGRC+1}" ]; then
  zmodload zsh/zprof 
fi


# Load zplug package manager
source ~/.zplug/init.zsh

# load custom config files
source ~/.zsh/manjaro
source ~/.zsh/homebrew
source ~/.zsh/go
source ~/.zsh/git
source ~/.zsh/zstyle
source ~/.zsh/functions

# vim key bindings 
zplug "jeffreytse/zsh-vi-mode"

# zsh plugins
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "bobthecow/git-flow-completion"

# Aliases
[ -f ~/.zsh/aliases ] && source ~/.zsh/aliases

# Functions
PATH=~/.zsh/functions:$PATH

# ~/.local/bin
PATH=~/.local/bin:$PATH

# external tools
source ~/.zsh/fzf
source ~/.zsh/ngrok
source ~/.zsh/zoxide
source ~/.zsh/starship
source ~/.zsh/thefuck
source ~/.zsh/jetbrains-toolbox
#source ~/.zsh/miniconda

# do not remove the trailing slash on path
setopt no_auto_remove_slash

# run zplug stuff
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/Users/alexander/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Get ZSH startup profiling data
if [ -n "${ZSH_DEBUGRC+1}" ]; then
	zprof
fi
