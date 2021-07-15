from libqtile.lazy import lazy
from libqtile.config import Group, Match,Key
from .keybinds import mod, keys

browser_matches = [
    Match(wm_class=["Brave-browser"]),
    Match(wm_class=["firefox"])
]

group_names = [
    ("desktop", {"layout": "floating", "matches": [Match(wm_class=["Thunar"])]}),
    ("browser", {"layout": "treetab", "matches": browser_matches}),
    ("code", {"layout": "monadtall", "matches": [Match(wm_class=["code"])]}),
    ("postman", {"layout": "max", "matches": [Match(wm_class=["Postman"])]}),
    ("notion", {"layout": "max", "matches": [Match(wm_class=["notion-snap"])]}),
    ("slack", {"layout": "max", "matches": [Match(wm_class=["slack"])]}),
    ("music",  {"layout": 'max', "matches": [Match(wm_class=["spotify"])]}),
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names):
    screen_code = str(i + 1)
    keys.extend([
        Key([mod], screen_code, lazy.group[name].toscreen()), # Switch to another group
        Key([mod, "shift"], screen_code, lazy.window.togroup(name)) # Send current window to another group
    ])

