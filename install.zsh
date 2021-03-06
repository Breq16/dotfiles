#!/bin/zsh

REPO_ABSOLUTE_PATH=$(pwd)

# install packages
if [[ `uname` == "Darwin" ]]
then
  if ! type brew > /dev/null
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew install --quiet $(cat $REPO_ABSOLUTE_PATH/packages/brew.txt)
fi

# download plugins
if [ -s ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]
then
else
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ -s ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]
then
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# symlink configs
rm -f ~/.zshrc
ln -s $REPO_ABSOLUTE_PATH/.zshrc ~/.zshrc

rm -f ~/.p10k.zsh
ln -s $REPO_ABSOLUTE_PATH/.p10k.zsh ~/.p10k.zsh

rm -rf ~/.config/neofetch
mkdir -p ~/.config
ln -s $REPO_ABSOLUTE_PATH/neofetch ~/.config/neofetch

rm -rf ~/.config/gh/config.yml
mkdir -p ~/.config/gh
ln -s $REPO_ABSOLUTE_PATH/gh/config.yml ~/.config/gh/config.yml

rm -rf ~/.gitconfig
ln -s $REPO_ABSOLUTE_PATH/git/.gitconfig ~/.gitconfig

rm -rf ~/.gitignore_global
ln -s $REPO_ABSOLUTE_PATH/git/.gitignore ~/.gitignore_global

rm -rf ~/.gnupg/gpg.conf
mkdir -p ~/.gnupg
ln -s $REPO_ABSOLUTE_PATH/.gnupg/gpg.conf ~/.gnupg/gpg.conf

rm -rf ~/.config/bat/config
mkdir -p ~/.config/bat
ln -s $REPO_ABSOLUTE_PATH/bat/config ~/.config/bat/config

rm -rf ~/.config/bottom/bottom.toml
mkdir -p ~/.config/bottom
ln -s $REPO_ABSOLUTE_PATH/bottom/bottom.toml ~/.config/bottom/bottom.toml

# gnome terminal profiles
if [ -s /usr/bin/dconf ]
then
  dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
fi
