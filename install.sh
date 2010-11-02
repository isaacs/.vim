#!/bin/bash

fail () {
  echo "$@" >&2
  exit 1
}
SCRIPT=$0
SCRIPTDIR=$(dirname -- "$SCRIPT")
for i in $HOME/.{g,}vim{rc,rc.local}; do
  if [ -f "$i" ] || [ -d "$i" ]; then
    echo "backing up $i to $i.bak"
    mv $i{,.bak} || fail "failed backup"
  fi
done
if ! [ "$SCRIPTDIR" == "$HOME/.vim" ]; then
  if [ -d "$HOME/.vim" ]; then
    mv -- "$HOME/.vim"{,.bak}
  fi
  echo "copying to $HOME/.vim"
  cp -r -- $SCRIPTDIR $HOME/.vim || fail "failed copy"
  cd $HOME/.vim
  $HOME/.vim/install.sh || fail "failed install"
  exit $?
fi

cd $HOME
ln -s .vim/vimrc .vimrc               || fail ".vimrc"
ln -s .vim/vimrc.local .vimrc.local   || fail ".vimrc.local"
ln -s .vim/gvimrc .gvimrc             || fail ".gvimrc"
ln -s .vim/gvimrc.local .gvimrc.local || fail ".gvimrc.local"

