mkdir -p ~/.vim/plugged
cd ~/.vim/plugged
git clone https://github.com/smasher816/vimrc.git

mkdir -p ~/.vim/autoload
ln -s vimrc/bootstrap.vim ~/.vim/autoload/bootstrap.vim
mv ~/.vimrc ~/.vimrc.bak
echo "call bootstrap#init()" >> ~/.vimrc
if [ -e ~/.vimrc.bak ]; then
	echo "source ~/.vimrc.bak" >> ~/.vimrc
fi

vim +PlugInstall
