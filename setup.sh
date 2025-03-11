#!/bin/env bash
dotfilesDir=$(pwd)

sudo apt -y update


if ! command -v git &> /dev/null; then
    sudo apt -y install git
fi

if [ ! -d $HOME/personal ]; then
    mkdir $HOME/personal
fi

git clone https://github.com/zx4rax/dotfiles $HOME/personal/dotfiles

pushd $HOME/personal/dev
./run
popd

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink
    echo "Removing existing symlink: ${dest}"
    rm ${dest}

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile .vim
linkDotfile .vimrc
linkDotfile .zshrc
linkDotfile .gitconfig

mkdir -p $dotfilesDir/.vim/bundle
cd $dotfilesDir/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
vim +PluginInstall +qall
