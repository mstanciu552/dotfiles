#!/usr/bin/env python3
import subprocess


def get_focused_window() -> str:
    proc = subprocess.Popen(
        "xtitle $(bspc query -N -n)", shell=True, stdout=subprocess.PIPE
    )
    return str(proc.stdout.read().decode("utf-8"))


def get_windows() -> str:
    proc = subprocess.Popen(
        "xtitle $(bspc query -N -n .window)", shell=True, stdout=subprocess.PIPE
    )
    return str(proc.stdout.read().decode("utf-8"))


def format_underline(window: str) -> str:
    return "%{u#0a6cf5}%{+u}" + window + "%{-u}"


def restrict(string: str, idx: int) -> str:
    return string[:idx] if len(string) >= idx else string


# TODO Add mouse action
def main():
    output = get_windows().split("\n")[:-1]
    focus = get_focused_window().split("\n")[0]
    out = ""
    for win in output:
        if win == focus:
            out += format_underline(restrict(win, 20)) + "   "
        else:
            out += restrict(win, 20) + "   "
    print(out)


if __name__ == "__main__":
    main()
