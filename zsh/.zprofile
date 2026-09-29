# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/alexander/.docker/bin"
# End of Docker Desktop section.

# Set PATH, MANPATH, etc., for Homebrew.
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Added by Toolbox App
export PATH="$PATH:/Users/alexander/Library/Application Support/JetBrains/Toolbox/scripts"

# Add global composer-installed binaries
export PATH="$PATH:$HOME/.composer/vendor/bin";


# Added by Antigravity CLI installer
export PATH="/Users/alexander/.local/bin:$PATH"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
