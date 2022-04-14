local awful = require("awful")
local beautiful = require("beautiful")
local keys = require("keys")


local rules = {
  { rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = keys.clientkeys,
      buttons = keys.clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
  },
  {
    rule = {
      class = 'Brave-browser'
    },
    properties = {
      tag= "2"
    }
  },
  {
    rule_any = {
      class = {
        'Postman',
        'Code'
      }
    },
    properties = {
      tag= "3"
    }
  },
  {
    rule_any = {
      class = {
        'Slack'
      }
    },
    properties = {
      tag= "4"
    }
  },
  {
    rule = {
      class = 'Firefox'
    },
    properties = {
      tag= "5"
    },
  },
  {
    rule_any = {
      class = {
        'Spotify',
      }
    },
    properties = {
      tag= "6"
    }
  },
  {
    rule_any = {
      class = {
        'Pavucontrol',
        'Arandr',
      },
    },
    properties = {
      tag= "7",
      placement = awful.placement.centered,
      floating = true
    }
  },
  {
    rule_any = {
      class = {
        'Gimp',
      }
    },
    properties = {
      tag= "8"
    }
  },
}

return rules
