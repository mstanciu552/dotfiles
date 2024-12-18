#!/usr/bin/env python3
import os
import time

if __name__ == "__main__":
    themes = open('./zsh-themes.txt', 'r').read().split('\n')[:-1]

    for theme in themes:
        os.system(f'source set-theme {theme}')
        time.sleep(3)
