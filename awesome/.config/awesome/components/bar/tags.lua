local awful = require('awful')
local wibox = require('wibox')
local gears = require("gears")

local config_dir = gears.filesystem.get_configuration_dir()
local icons_path = config_dir .. '/icons/'


local taglist_buttons = gears.table.join(
              awful.button({ }, 1, function(t) t:view_only() end),
                  awful.button({ modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
                  awful.button({ }, 3, awful.tag.viewtoggle),
                  awful.button({ modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
                  awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                  awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
              )

local create_taglist = function(s)
  awful.tag.add('1', {
    icon = icons_path .. 'code_icon.svg',
    layout = awful.layout.suit.tile.right,
    screen = s,
  })
  awful.tag.add('2', {
    icon = icons_path .. 'brave_icon.svg',
    layout = awful.layout.suit.max,
    screen = s,
  })
  awful.tag.add('3', {
    icon = icons_path .. 'tools_icon.svg',
    layout = awful.layout.suit.max,
    screen = s,
  })
  awful.tag.add('4', {
    icon = icons_path .. 'chat_icon.svg',
    layout = awful.layout.suit.max,
    screen = s,
  })
  awful.tag.add('5', {
    icon = icons_path .. 'firefox_icon.svg',
    layout = awful.layout.suit.max,
    screen = s,
  })
  awful.tag.add('6', {
    icon = icons_path .. 'music_icon.svg',
    layout = awful.layout.suit.max,
    screen = s,
  })
  awful.tag.add('7', {
    icon = icons_path .. 'box_icon.svg',
    layout = awful.layout.suit.float,
    screen = s,
  })
  awful.tag.add('8', {
    icon = icons_path .. 'art_icon.svg',
    layout = awful.layout.suit.max,
    screen = s,
  })

  return awful.widget.taglist {
      screen  = s,
      widget = wibox.container.margin,
      filter  = awful.widget.taglist.filter.all,
      layout = wibox.layout.fixed.horizontal,
      buttons = taglist_buttons
  }
end

return create_taglist
