App = {
  brave = "brave",
  firefox = "firefox",
  notion = "notion",
  slack = "slack",
  gimp = "gimp",
  spotify = "spotify",
  launcher = "rofi -show run",
  screenshot = "scrot 'screenshot_%Y%m%d_%H%M%S.png' -e 'mkdir -p ~/Pictures/screenshots && mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/`ls -1 -t ~/Pictures/screenshots | head -1`'",
}

