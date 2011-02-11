#!/bin/bash
# Put this script file in the source directory of vim 7.3
# and run:
#  ./vim-config.sh && make && sudo make install
# to get a version of vim that works with this setup.
./configure \
  --prefix=/usr/local \
  --mandir=/usr/local/share/man \
  --enable-gui=no \
  --without-x \
  --disable-nls \
  --enable-multibyte \
  --with-tlib=ncurses \
  --enable-pythoninterp \
  --enable-rubyinterp \
  --with-features=huge
