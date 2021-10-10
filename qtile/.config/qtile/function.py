
import os
from libqtile import widget
from libqtile.command import lazy

# load pywal colors
colors = []
cache = os.path.expanduser('~')+'/.cache/wal/colors'


def load_colors(cache):
    with open(cache, 'r') as file:
        for i in range(16):
            colors.append(file.readline().strip())
    colors.append('#ffffff')


load_colors(cache)

panel_height = 40


def powerline_arrow(direction, color1, color2):
    if direction == "r":
        return [
            widget.TextBox(
                text=u"\ue0b0",
                foreground=color1,
                background=color2,
                fontsize=panel_height,
            ),
            widget.Sep(padding=5, linewidth=0, background=color2),
        ]
    else:
        return [
            widget.Sep(padding=14, linewidth=0, background=color1),
            widget.TextBox(
                text=u"\ue0b2",
                foreground=color2,
                background=color1,
                fontsize=panel_height,
            ),
        ]


class Functions:
    @staticmethod
    def kill_all_windows():
        @lazy.function
        def __inner(qtile):
            for window in qtile.current_group.windows:
                window.kill()

        return __inner

    @staticmethod
    def kill_all_windows_minus_current():
        @lazy.function
        def __inner(qtile):
            for window in qtile.current_group.windows:
                if window != qtile.current_window:
                    window.kill()
        return __inner
