# Profile ZSH startup
if [ -n "${ZSH_DEBUGRC+1}" ]; then
  zmodload zsh/zprof
fi

# Load antidote package manager
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
antidote_zsh_path=$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
if [[ ! $antidote_zsh_path -nt ${zsh_plugins}.txt ]]; then
  (
    source $antidote_zsh_path
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh

# load custom config files
source ~/.zsh/history
source ~/.zsh/manjaro
source ~/.zsh/homebrew
source ~/.zsh/go
source ~/.zsh/git
source ~/.zsh/zstyle
source ~/.zsh/functions

# vim key bindings 
export EDITOR=nvim
export VISUAL=nvim

# Aliases
[ -f ~/.zsh/aliases ] && source ~/.zsh/aliases

# Functions
PATH=~/.zsh/functions:$PATH

# ~/.local/bin
PATH=~/.local/bin:$PATH

# external tools
#source ~/.zsh/flutter
#source ~/.zsh/asdf
source ~/.zsh/docker
source ~/.zsh/fzf
#source ~/.zsh/ngrok
source ~/.zsh/ruby
source ~/.zsh/starship
source ~/.zsh/tailscale
#source ~/.zsh/television
#source ~/.zsh/thefuck
source ~/.zsh/zoxide
source ~/.zsh/antigravity
source ~/.zsh/pnpm

# do not remove the trailing slash on path
setopt no_auto_remove_slash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Lazy-load NVM
# based on https://allandeutsch.com/notes/zsh-startup
export NVM_DIR="$HOME/.nvm"
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_AUUTO_USE=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')


# Get ZSH startup profiling data
if [ -n "${ZSH_DEBUGRC+1}" ]; then
	zprof
fi

# Added by Antigravity CLI installer
export PATH="/Users/alexander/.local/bin:$PATH"
