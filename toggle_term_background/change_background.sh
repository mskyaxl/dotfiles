#!/usr/bin/env bash

function toggle_background_alacritty() {
  if [ -f "~/.config/alacritty/alacritty.yml" ];
  then
    echo "file ~/.config/alacritty/alacritty.yml doesn't exist"
    return
  fi
  config_path=$(realpath ~/.config/alacritty/alacritty.yml)
  gawk -i inplace -f awkcond $config_path
}

function toggle_background_vim() {

  for pid in $(pgrep vim | paste -sd\ )
  do
    # in vim.rc a fuction is triggered when a SIGUSR1 signal is received
    kill -SIGUSR1 $pid
  done
}



function toggle_background() {
 toggle_background_alacritty
 toggle_background_vim
}


toggle_background

