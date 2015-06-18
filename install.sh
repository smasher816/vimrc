if [ -x "$(command -v nvim)" ]; then
	: ${VIMRC:=~/.nvimrc}
	: ${VIMHOME:=~/.nvim}
	: ${VIMBIN:=nvim}
else
	: {VIMRC:=~/.vimrc}
	: {VIMHOME:=~/.vim}
	: {VIMBIN:=vim}
fi

mkdir -p $VIMHOME/plugged
cd $VIMHOME/plugged
git clone https://github.com/smasher816/vimrc.git

mkdir -p $VIMHOME/autoload
cd  $VIMHOME/autoload
ln -s ../plugged/vimrc/bootstrap.vim .

echo "VIMRC=$VIMRC"
if [ -e $VIMRC ]; then
	grep -qse "bootstrap#init()" $VIMRC || sed -i '1icall bootstrap#init()\' $VIMRC
else
	echo "call bootstrap#init()" > $VIMRC
fi

$VIMBIN +PlugInstall
