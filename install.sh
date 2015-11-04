${XDG_DATA_HOME:=$HOME/.local/share}
${XDG_CONFIG_HOME=$HOME/.config}

if [ -x "$(command -v nvim)" ]; then
	VIM=${VIM:-$XDG_CONFIG_HOME/nvim}
	VIMHOME=${VIMHOME:-$XDG_DATA_HOME/nvim}
	VIMINIT=${VIMINIT:$VIM/init.vim}
	VIMBIN=${VIMBIN:-nvim}
else
	VIM={$VIM:-~/.vim}
	VIMHOME=${VIMHOME:-~/.vim}
	VIMINIT=${VIMINIT:-$VIM/vimrc}
	VIMBIN=${VIMBIN:-vim}
fi

mkdir -p $VIM

mkdir -p $VIMHOME/plugged
cd $VIMHOME/plugged
git clone https://github.com/smasher816/vimrc.git

mkdir -p $VIMHOME/autoload
cd  $VIMHOME/autoload
ln -s ../plugged/vimrc/bootstrap.vim .

if [ -e $VIMINIT ]; then
	grep -qse "bootstrap#init()" $VIMINIT || sed -i '1icall bootstrap#init()\' $VIMINIT
else
	echo "call bootstrap#init()" > $VIMINIT
fi

$VIMBIN +PlugInstall
