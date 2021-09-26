from libqtile.config import Key, KeyChord
from libqtile.lazy import lazy
from .keymaps import KeyboardLayout

keyboard = KeyboardLayout()

mod = "mod4"
terminal = 'alacritty'


keys = [
    # Switch between windows
    Key([mod], keyboard.window_left, lazy.layout.left(), desc="Move focus to left"),
    Key([mod], keyboard.window_right, lazy.layout.right(), desc="Move focus to right"),
    Key([mod], keyboard.window_down, lazy.layout.down(), desc="Move focus down"),
    Key([mod], keyboard.window_up, lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], keyboard.window_left, lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], keyboard.window_right, lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], keyboard.window_down, lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], keyboard.window_up, lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], keyboard.window_left, lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], keyboard.window_right, lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], keyboard.window_down, lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], keyboard.window_up, lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "space", lazy.layout.flip()),
    Key([mod], keyboard.window_grow, lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], keyboard.window_maximize, lazy.layout.maximize()),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], keyboard.window_close, lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], keyboard.restart_qtile, lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], keyboard.shutdown_qtile, lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], keyboard.restart_qtile, lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    #rofi menu
    Key([mod, "shift"], keyboard.menu, lazy.spawn("rofi -show")),
    Key([mod], keyboard.menu, lazy.spawn("rofi -show run")),

    #get wm_class
    Key([mod, "control", "shift"], "p", lazy.spawn(terminal + " -e xprop | grep WM_CLASS | awk '{print $4}'")),

    #print_screen
    Key([], "Print", lazy.spawn("scrot 'screenshot_%Y%m%d_%H%M%S.png' -e 'mkdir -p ~/Pictures/screenshots && mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/`ls -1 -t ~/Pictures/screenshots | head -1`'")),

    # Key([mod, "shift"], "s", lazy.spawm("scrot -s")),
    Key([mod, "shift"], keyboard.screen_shot, lazy.spawn("scrot -s 'screenshot_%Y%m%d_%H%M%S.png' -e 'mkdir -p ~/Pictures/screenshots && mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/`ls -1 -t ~/Pictures/screenshots | head -1`'")),

    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
]
