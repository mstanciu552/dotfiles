#!/bin/bash
# Delete the wallpapers 
rm -rf ~/Pictures/wallpapers

# Delete all configs that already exist in this repository
for directory in $(ls); do
  rm -rf "~/.config/$directory"
done
