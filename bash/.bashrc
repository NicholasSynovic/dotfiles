# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Prompt Template
PROMPT_TEMPLATE="\u@\H \W \t \$ "

# Identify chroot
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
  PS1='${debian_chroot:+($debian_chroot)}$PROMPT_TEMPLATE'
fi

# Set PATH
if [ -f "$HOME/.path_config" ]; then
    . "$HOME/.path_config"
fi

# Prompt config
PS1=$PROMPT_TEMPLATE
PS2="	> "

# Set aliases
if [ -f "$HOME/.aliases" ]; then
    . "$HOME/.aliases"
fi

# Configure Bash History
HISTCONTROL=ignoreboth
HISTFILE="$HOME/.history"
HISTFILESIZE=2000
HISTSIZE=1000

# Configure Shell Options
shopt -s cdspell
shopt -s checkhash
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s histappend
shopt -s hostcomplete
shopt -s interactive_comments
shopt -s progcomp
shopt -s sourcepath

# Enable programmable completion features in case `shopt -s progcomp doesn't work
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
