#!/usr/bin/env python3
import subprocess

data = subprocess.check_output(
    ['netsh', 'wlan', 'show', 'profiles']).decode('utf-8').split('\n')
