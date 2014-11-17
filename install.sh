ln -sf ~/.vimrc-yake/.vimrc ~/.vimrc
ln -sf ~/.vimrc-yake/.vimrc.bundles ~/.vimrc.bundles

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
