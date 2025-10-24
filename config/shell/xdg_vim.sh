#! /usr/bin/env sh

# support for xdg on vim previous to 9.1.0327
if [ "$(vim --clean -es +'exec "!echo" has("patch-9.1.0327")' +q)" -eq 0 ]; then
	export VIMINIT="set nocp | source ${XDG_CONFIG_HOME}/vim/vimrc"
fi
