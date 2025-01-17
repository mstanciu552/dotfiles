#!/bin/bash

CONFIG=~/.tmux.conf

if [ -f "$CONFIG" ]; then
  rm ~/.tmux.conf
fi
ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf
