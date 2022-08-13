#!/usr/bin/env bash

rm -rf ~/.local/share/newflasher
rm -f ~/bin/newflasher
git clone https://github.com/munjeni/newflasher.git ~/.local/share/newflasher

make -C ~/.local/share/newflasher

ln -s ~/.local/share/newflasher/newflasher ~/bin
