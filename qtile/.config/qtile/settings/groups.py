from libqtile.lazy import lazy
from libqtile.config import Group, Match,Key
from .keybinds import mod, keys

fun_stuff_matches = [
    Match(wm_class=["firefox"]),
    Match(wm_class=["spotify"])
]
chat_matches = [
    Match(wm_class=["discord"]),
    Match(wm_class=["slack"])
]

group_names = [
    (".1", {"layout": "monadtall"}),
    ("異.2", {"layout": "monadtall", "matches": [Match(wm_class=["postman"])]}),
    (" .3", {"layout": "treetab", "matches": [Match(wm_class=["brave-browser-nightly"])]}),
    (".4",  {"layout": 'monadtall'}),
    ("聆.5", {"layout": "treetab", "matches": chat_matches}),
    (".6", {"layout": "max", "matches": [Match(wm_class=["notion-app"])]}),
    (".7",  {"layout": 'treetab', "matches": fun_stuff_matches})
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names):
    screen_code = str(i + 1)
    keys.extend([
        Key([mod], screen_code, lazy.group[name].toscreen()), # Switch to another group
        Key([mod, "shift"], screen_code, lazy.window.togroup(name)) # Send current window to another group
    ])

