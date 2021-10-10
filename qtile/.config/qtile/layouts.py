
from libqtile import layout
from libqtile.config import Match
from function import colors
margin = 10

# Default layout values
layouts_default = dict(
    border_normal=colors[0],
    border_focus=colors[5],
    border_width=2,
    margin=margin
)

# Layouts
layouts = [

    layout.MonadTall(**layouts_default),
    layout.MonadWide(**layouts_default),
    layout.Floating(**layouts_default)
]

# Floating layout
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="Nitrogen"),
        Match(wm_class="Thunar"),
        Match(wm_class="GParted"),
    ],
    **layouts_default
)
