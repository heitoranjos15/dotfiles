from settings.colors import colors
from libqtile.config import Match
from libqtile import layout


layout_theme = {"border_width": 1,
                "margin": 5,
                "border_focus": colors.get('yellow')[0],
                "border_normal": "777777"
                }

layouts = [
    layout.Columns(**layout_theme),
    layout.Max(),
    layout.MonadTall(**layout_theme),
    layout.TreeTab(
        panel_width = 80,
        bg_color= colors.get('black')[0],
        active_bg = colors.get('yellow')[0],
        inactive_bg = colors.get('black')[1],
        sections = ["Searches"]
    ),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='Thunar')
])

