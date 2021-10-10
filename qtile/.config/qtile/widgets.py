from libqtile import widget
from function import colors
from settings import colored, reverse, decor

decor = widget.TextBox(
    text=decor,
    foreground=colors[0] if colored == 'full' or colored == 'compact' and 'decor' in reverse else colors[7],
    background=colors[7] if colored == 'full' or colored == 'compact' and 'decor' in reverse else colors[0],
)

net_fold = widget.WidgetBox(
    widgets=[
        widget.Net(
            interface='enp1s0',
            format="{down} ↓↑{up}",
            foreground=colors[0] if colored == 'full' or colored == 'compact' and 'net' in reverse else colors[7],
            background=colors[7] if colored == 'full' or colored == 'compact' and 'net' in reverse else colors[0],
        )
    ],
    foreground=colors[0] if colored == 'full' or colored == 'compact' and 'net_fold' in reverse else colors[7],
    background=colors[7] if colored == 'full' or colored == 'compact' and 'net_fold' in reverse else colors[0],
    text_closed=' [<] ',
    text_open=' [>] '
)


windowname = widget.WindowName(
    max_chars=20,
    foreground=colors[0] if colored == 'full' or colored == 'compact' and 'windowname' in reverse else colors[7],
    background=colors[7] if colored == 'full' or colored == 'compact' and 'windowname' in reverse else colors[0],
)


volume = widget.Volume(
    update_interval=0,
    foreground=colors[0] if colored == 'full' or colored == 'compact' and 'volume' in reverse else colors[7],
    background=colors[7] if colored == 'full' or colored == 'compact' and 'volume' in reverse else colors[0],
)
