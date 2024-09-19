# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set theme
ZSH_THEME="robbyrussell"

# Add plugins
plugins=(git)

# Source original config
source $ZSH/oh-my-zsh.sh

# Source shell profile
if [ -f $HOME/.shell_profile ]; then
    . $HOME/.shell_profile
fi
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"
