#!/bin/bash

git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.config/zsh/zsh-syntax-highlighting
git clone https://github.com/zdharma/fast-syntax-highlighting $HOME/.config/zsh/fast-syntax-highlighting
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
