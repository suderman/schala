#!/bin/sh

# Link up new vim configuration
rm -rf "$HOME/.vimrc"
ln -sfn "$HOME/.vim/vimrc.vim" "$HOME/.vimrc"
rm -rf "$HOME/.gvimrc"
ln -sfn "$HOME/.vim/gvimrc.vim" "$HOME/.gvimrc"
echo "Linked vimrc, gvimrc"

# Ensure .vim directory and subdirectory for swp files is ready
mkdir -p "$HOME/.vim/backup"
mkdir -p "$HOME/.vim/bundle"
echo "Created .vim backup and bundle directories"

# Install source.vim
mkdir -p "$HOME/.vim/plugin"
if [ ! -d "$HOME/.vim/source.vim" ]; then
  git clone git@github.com:suderman/source.vim.git "$HOME/.vim/source.vim"
fi
ln -sfn "$HOME/.vim/source.vim/plugin/source.vim" "$HOME/.vim/plugin/source.vim"
echo "Installed source.vim"