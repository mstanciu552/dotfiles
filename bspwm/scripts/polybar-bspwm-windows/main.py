#!/usr/bin/env python3
import subprocess

ICONS = [
    ("class=*.slack.com", "\uf3ef"),
    ("class=Chromium", "\uf268 "),
    ("class=Brave-browser", "\uf268 "),
    ("class=Firefox", "\uf269 "),
    ("class=kitty", "\uf120 "),
    ("class=Code", "\ue70c "),
    ("class=discord", "\uf392 "),
    ("class=code-oss-dev", "\ue70c "),
    ("name=mutt", "\uf199"),
    ("*", ""),
]


def get_win_id():
    proc = subprocess.Popen(
        "wmctrl -lx | awk '{$2=$3=$4=\" \";print}'", shell=True, stdout=subprocess.PIPE
    )
    data = str(proc.stdout.read().decode("utf-8")).split("\n")[:-1]
    data = [(d.split("       ")[0], d.split("       ")[1]) for d in data]
    return data


DATA = get_win_id()


def get_focused_window() -> str:
    proc = subprocess.Popen(
        "xtitle $(bspc query -N -n)", shell=True, stdout=subprocess.PIPE
    )
    return str(proc.stdout.read().decode("utf-8"))


def set_action(window: str) -> str:
    id = -1
    for data in DATA:
        if window in data[1]:
            id = data[0]
            break
    if id == -1:
        return window
    command = "bspc node -f " + str(id)
    action = "%{A1:" + command + ":}"
    return action + window + "%{A}"


def get_windows() -> str:
    proc = subprocess.Popen(
        "xtitle $(bspc query -N -n .window)", shell=True, stdout=subprocess.PIPE
    )
    return str(proc.stdout.read().decode("utf-8"))


def format_underline(window: str) -> str:
    return "%{u#0a6cf5}%{+u}" + window + "%{-u}"


def restrict(string: str, idx: int) -> str:
    return string[:idx] if len(string) >= idx else string


# TODO Add icons
def main():
    output = get_windows().split("\n")[:-1]
    if len(output) < 1:
        return
    focus = get_focused_window().split("\n")[0]
    out = ""
    for win in output:
        if win == focus:
            out += format_underline(restrict(win, 20)) + "   "
        else:
            out += set_action(restrict(win, 20)) + "   "
    print(out)


if __name__ == "__main__":
    main()
