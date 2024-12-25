# NixOS configuration

## How to install

Command to run:

```sh
sudo nixos-rebuild switch --flake '.#'
```

There is also a cleanup script: `cleanup.sh`

## What is this?

This is my configuration of nixos using my own dotfiles. It aims to be able to create reproducible and stable systems to be used just as I like them.

Main components right now:

1. i3 - window manager
2. tmux - terminal multiplexer
3. lunarvim - nvium config
4. zsh - shell config
5. wallpapers - my wallpaper repository

I want to keep developing it to allow everything I will ever need to be slapped on a system and have it up and running right away.

Future goals - TODOs:

- [ ] basic vim config for lightweight usability
- [ ] display resolution and fps management
- [ ] disk partition management
- [ ] virtualization automation
- [ ] programming languages environments
