#!/bin/bash

next=$(i3-msg -t get_workspaces | jq -r '.[]| select(.focused).num + 1')
prev=$(i3-msg -t get_workspaces | jq -r '.[]| select(.focused).num - 1')


if [[ $1 == "next" ]] 
then
  if [[ $next -lt 10 ]]
  then
    i3-msg workspace number "$next"
  else
    i3-msg workspace number "1"
  fi
fi


if [[ $1 == "prev" ]]
then
  if [[ $prev -gt 0 ]]
  then
    i3-msg workspace number "$prev"
  else
    i3-msg workspace number "9"
  fi
fi
