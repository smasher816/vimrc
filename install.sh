if [ -x "$(command -v nvim)" ]; then
	VIMRC=${VIMRC:-~/.nvimrc}
	VIMHOME=${VIMHOME:-~/.nvim}
	VIMBIN=${VIMBIN:-nvim}
else
	VIMRC=${VIMRC:-~/.vimrc}
	VIMHOME=${VIMHOME:-~/.vim}
	VIMBIN=${VIMBIN:-vim}
fi

echo VIMHOME=$VIMHOME

mkdir -p $VIMHOME/plugged
cd $VIMHOME/plugged
git clone https://github.com/smasher816/vimrc.git

mkdir -p $VIMHOME/autoload
cd  $VIMHOME/autoload
ln -s ../plugged/vimrc/bootstrap.vim .

if [ -e $VIMRC ]; then
	grep -qse "bootstrap#init()" $VIMRC || sed -i '1icall bootstrap#init()\' $VIMRC
else
	echo "call bootstrap#init()" > $VIMRC
fi

$VIMBIN +PlugInstall
