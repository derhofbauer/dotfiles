# Set PATH, MANPATH, etc., for Homebrew.
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Added by Toolbox App
export PATH="$PATH:/Users/alexander/Library/Application Support/JetBrains/Toolbox/scripts"

# Add global composer-installed binaries
export PATH="$PATH:$HOME/.composer/vendor/bin";
