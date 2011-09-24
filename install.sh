#!/bin/sh

# Link up new vim configuration
rm -rf "$HOME/.vimrc"
ln -sfn "$HOME/.vim/vimrc.vim" "$HOME/.vimrc"
rm -rf "$HOME/.gvimrc"
ln -sfn "$HOME/.vim/gvimrc.vim" "$HOME/.gvimrc"
echo "Linked vimrc, gvimrc"

# Ensure .vim directory and subdirectory for swp files is ready
mkdir -p "$HOME/.vim/backup"
echo "Created .vim directory and backup for swp"

# Install source.vim
mkdir -p "$HOME/.vim/plugin"
mkdir -p "$HOME/.vim/after/syntax/vim"
if [ ! -d "$HOME/.vim/bundle/source.vim" ]; then
  git clone git@github.com:suderman/source.vim.git "$HOME/.vim/bundle/source.vim"
fi
ln -sfn "$HOME/.vim/bundle/source.vim/plugin/source.vim" "$HOME/.vim/plugin/source.vim"
ln -sfn "$HOME/.vim/bundle/source.vim/after/syntax/vim/source.vim" "$HOME/.vim/after/syntax/vim/source.vim"
echo "Installed source.vim"