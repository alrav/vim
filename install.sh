# First, backup existing Vim configurations
BACKUP_ROOT=~/.vimbak

# Delete latest backup and recreate every time
rm -rf $BACKUP_ROOT
mkdir $BACKUP_ROOT

if [ -f ~/.vimrc ]; then
	mv ~/.vimrc $BACKUP_ROOT/.vimrc
fi

if [ -d ~/.vim ]; then
	mv ~/.vim $BACKUP_ROOT/.vim
fi

# Copy .vim and .vimrc over to primary user directory
cp ./.vimrc ~/.vimrc
cp -R ./.vim ~/.vim

# Get the latest Vundle dependency manager from Git
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install the plugins
vim +PluginInstall +qall

