#!/bin/bash
dirs=$(ls .)
PWD=$(pwd)

for dir in $dirs; do
  ln -sf $PWD/$dir $HOME/.config/
  if [[ -f "$dir/install.sh" ]]; then
    bash "$dir/install.sh"
  fi
done
