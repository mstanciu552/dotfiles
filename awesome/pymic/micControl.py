#!/usr/bin/env python3
import re
import sys
import subprocess

def normalize(value: int):
    return int((value * 65536) / 100)

def symbol():
    muted = " " + str(get_volume()) + "% "
    unmuted = " " + str(get_volume()) + "% "
    return unmuted if get_volume() == 0 else muted

def mute(sink: int):
    subprocess.run(["pacmd", "set-source-mute", str(sink), "1"])
    set_volume(sink, 0)

def unmute(sink: int):
    subprocess.run(["pacmd", "set-source-mute", str(sink), "0"])
    set_volume(sink, normalize(20))

def set_volume(sink:int, value: int):
    if value > 65536:
        return
    subprocess.run(["pacmd", "set-source-volume", str(sink), str(value)])

def get_volume():
    cmd = "pacmd list-sources | grep front-left"
    ps = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    info = ps.communicate()[0].decode("utf-8") # Get output and decode it to a string
    info = info.split('\n') # Split based on rows

    volume = re.search(r'\d+%', info[2])
    return int(volume.group(0)[:-1]) if volume else -1

def main(args):
    STEP = 5

    if args[-1] == '--mute':
        mute(1)
    elif args[-1] == '--unmute':
        unmute(1)
    elif args[-1] == '--inc':
        set_volume(1, normalize(get_volume() + STEP))
    elif args[-1] == '--dec':
        set_volume(1, normalize(get_volume() - STEP))
    elif args[-2] == '--set':
        set_volume(1, normalize(int(args[-1])))
    elif args[-1] == '--get':
        print(get_volume())
    elif args[-1] == '--query':
        print(symbol())


if __name__ == "__main__":
    main(sys.argv)
