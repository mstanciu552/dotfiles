#!/bin/bash

next=$(i3-msg -t get_workspaces | jq -r '.[]| select(.focused).num + 1')
prev=$(i3-msg -t get_workspaces | jq -r '.[]| select(.focused).num - 1')

if [[ "$next" > 10 ]]
then
if [[ $1 == "next" ]] 
then
  i3-msg workspace number "$next"
fi
fi

if [[ "$prev" > 0 ]]
then
if [[ $1 == "prev" ]]
then
  i3-msg workspacenumber "$prev"
fi
fi
