# fig autocomplete
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export GPG_TTY=$(tty)

# TI-84 Plus CE toolchain
[ -s "$HOME/CEdev" ] && export PATH="$HOME/CEdev/bin:$PATH"

# Racket lang
[ -s "/Applications/Racket\ v8.2" ] && export PATH="/Applications/Racket\ v8.2/bin:$PATH"

# Java OpenJDK
[ -s "/opt/homebrew/opt/openjdk" ] && export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# PyEnv
eval "$(pyenv init -)"

# Android Studio
[ -s "$HOME/Library/Android/sdk" ] && export ANDROID_HOME=$HOME/Library/Android/sdk && export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

eval $(thefuck --alias frick)

# Bun JavaScript toolchain
[ -s "$HOME/.bun" ] && export BUN_INSTALL="$HOME/.bun" && export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"


export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ohmyzsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# ohmyzsh plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ROS
[ -s "/opt/ros/noetic" ] && source /opt/ros/noetic/setup.zsh

# fig autocomplete
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh