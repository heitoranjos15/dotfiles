import os
import socket
from libqtile import widget
from libqtile import qtile
from settings.colors import Colors

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

default_args = {
    "font": "Fira Mono Nerd Font",
    "fontsize": 10
}

def set_colors(bg="BLACK", fg="WHITE"):
    return {
        "background": Colors[bg].value,
        "foreground": Colors[fg].value
    }

def arrow_left(bg="BLACK", fg="YELLOW"):
    return widget.TextBox(
        text="",
        padding=-15,
        fontsize=70,
        **set_colors(bg, fg)
    )

def icon(text, bg, fg="BLACK"):
    return widget.TextBox(
        text=text,
        padding=5,
        fontsize=24,
        **set_colors(bg, fg)
    )

small_sep = widget.Sep(
    linewidth = 0,
    padding = 10,
    **set_colors()
)

larger_sep = widget.Sep(
    linewidth = 0,
    padding = 40,
    **set_colors()
)

def workspaces():
    return [
        widget.CurrentLayoutIcon(
            scale=0.7,
            padding=0,
            custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
            **set_colors()
        ),
        small_sep,
        widget.GroupBox(
            active = Colors.WHITE1.value,
            inactive = Colors.BLACK1.value,
            borderwidth=2,
            this_current_screen_border= Colors.YELLOW.value,
            this_screen_border = Colors.YELLOW.value,
            urgent_border = Colors.RED.value,
            disable_drag = True,
            margin_y=3,
            margin_x=0,
            paddyng_y=8,
            padding_x=10,
            font="Fira Mono Nerd Font",
            fontsize= 13,
            **set_colors()
        ),
        small_sep,
        widget.Prompt(
            prompt = prompt,
            padding=10,
            **default_args,
            **set_colors("YELLOW", "BLACK")
        ),
        small_sep,
        widget.WindowName(
            padding=5,
            **set_colors(),
            **default_args,
        )
    ]

widget_primary = [
    *workspaces(),
    larger_sep,
    icon(bg="CYAN", text=' '),
    widget.Clock(
        **set_colors(bg='CYAN', fg="BLACK"), 
        format='%a %d/%m/%Y - %H:%M ',
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('alacritty -e calcurse')},
    ),
    
    icon(bg="YELLOW", text=' '),
    widget.Volume(
        padding=5,
        volume_app="pavucontrol",
        **set_colors(bg="YELLOW", fg="BLACK")    
    ),
    icon(bg="CYAN",text="⟳"),
    widget.CheckUpdates(
        padding=5,
        colour_have_updates=Colors.RED.value,
        colour_no_updates=Colors.BLACK.value,
        no_update_string='0',
        distro= "Arch",
        display_format='{updates} Updates',
        update_interval=1800,
        custom_command='checkupdates',
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('alacritty -e sudo pacman -Syu')},
        **set_colors(bg="CYAN")
    ),
    widget.Systray(
        **set_colors(),
        padding=5,
    ),
]

widget_secondary = [
    *workspaces()
]
