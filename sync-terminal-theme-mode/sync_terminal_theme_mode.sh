#!/usr/bin/env bash

# This script is only working in Gnome and it changes the theme mode for
# alacritty and vim 
# Use it with https://extensions.gnome.org/extension/2236/night-theme-switcher/
# set this sript to be called when the theme is changed 

function set_alacritty_theme_mode() {
  if [ -f "~/.config/alacritty/alacritty.yml" ]; then
    echo "file ~/.config/alacritty/alacritty.yml doesn't exist"
    return
  fi

  change_to=$1
  [[ $change_to == "dark" ]] && change_from="light" || change_from="dark"

  config_path=$(realpath ~/.config/alacritty/alacritty.yml)

  sed_expr="s/colors:\\(.*\\)$change_from/colors:\\1$change_to/g"
  sed -i $sed_expr $config_path

}

function sync_vim_theme_mode() {
  #for now, every VIM process reacts to SIGUSR1 and checks on its own the mode
  #to change to
  #TODO: find a better way to distribute this info to all the vim processes
  for pid in $(pgrep vim | paste -sd\ )
  do
    # in vim.rc a fuction is triggered when a SIGUSR1 signal is received
    kill -SIGUSR1 $pid
  done
}

function sync_tmux_theme_mode()
{
  change_to=$1
  #echo "changing the mode for TMUX is not supported yet"
  #TODO add the posibility to change TMUX theme
}

function sync_terminal_theme_mode() {
  change_to=$1
  set_alacritty_theme_mode $change_to
  sync_tmux_theme_mode $change_to
  sync_vim_theme_mode
}

function main()
{

  prefered=$(dconf read /org/gnome/desktop/interface/color-scheme)
  [[ $prefered == "'prefer-dark'" ]] && change_to="dark" || change_to="light"

  sync_terminal_theme_mode $change_to

}

main
