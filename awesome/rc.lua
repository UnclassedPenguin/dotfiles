-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- Home directory
local homedir = "/home/tyler/"

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
--beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

--MY THEME
beautiful.init(homedir .. ".config/awesome/theme.lua")

-- Function to send a notification to the screen, useful for debugging
local function notify(title, message)
  naughty.notify({
    preset = naughty.config.presets.normal,
    title = title,
    text = message,
    time = 5, -- Notification displays for 5 seconds
    position = "top_right",
  })
end

--{{{ Theme color changer

-- The local file to save current theme to and read the current theme from
local saved_theme_file = homedir .. ".config/awesome/current_theme"

-- Here is where the themes are defined. A theme comprises of 5 elements,
-- a theme_icon, theme_color(background), fg_color(font color),
-- squares_sel icon and a squares_unsel icon
-- So theme 1 would be themes[1][1], themes[1][2], themes[1][3]
-- themes[1][4] themes[1][5]
local themes = {
  -- Theme 1: White 
  {homedir .. "Pictures/awesome-assets/whitemenu.png", "#ffffff", "#000000",
   homedir .. "Pictures/awesome-assets/whitemenu-19x19.png",
   homedir .. "Pictures/awesome-assets/whitemenu-19x19.png"},
  -- Theme 2: Light Purple
  {homedir .. "Pictures/awesome-assets/lightpurplemenu.png", "#b3a0c3", "#ffffff",
   homedir .. "Pictures/awesome-assets/lightpurplemenu-19x19.png",
   homedir .. "Pictures/awesome-assets/whitemenu-19x19.png"},
  -- Theme 3: Purple
  {homedir .. "Pictures/awesome-assets/purplemenu.png", "#696699", "#ffffff",
   homedir .. "Pictures/awesome-assets/purplemenu-19x19.png",
   homedir .. "Pictures/awesome-assets/whitemenu-19x19.png"},
  -- Theme 4: Rose
  {homedir .. "Pictures/awesome-assets/rosemenu.png", "#a76d7d", "#ffffff",
   homedir .. "Pictures/awesome-assets/rosemenu-19x19.png",
   homedir .. "Pictures/awesome-assets/whitemenu-19x19.png"},
  -- Theme 5: Light grey
  {homedir .. "Pictures/awesome-assets/lightgreymenu.png", "#7f7f7f", "#ffffff",
   homedir .. "Pictures/awesome-assets/lightgreymenu-19x19.png",
   homedir .. "Pictures/awesome-assets/whitemenu-19x19.png"},
  -- Theme 6: Teal
  {homedir .. "Pictures/awesome-assets/tealmenu.png", "#6a9a9a", "#ffffff",
   homedir .. "Pictures/awesome-assets/tealmenu-19x19.png",
   homedir .. "Pictures/awesome-assets/whitemenu-19x19.png"},
  -- Theme 7: Green
  {homedir .. "Pictures/awesome-assets/greenmenu.png", "#a8d8a0", "#000000",
   homedir .. "Pictures/awesome-assets/greenmenu-19x19.png",
   homedir .. "Pictures/awesome-assets/whitemenu-19x19.png"},
  -- Theme 8: Yellow
  {homedir .. "Pictures/awesome-assets/yellowmenu.png", "#e6d68a", "#000000",
   homedir .. "Pictures/awesome-assets/yellowmenu-19x19.png",
   homedir .. "Pictures/awesome-assets/whitemenu-19x19.png"},
  -- Theme 9: Dark red
  {homedir .. "Pictures/awesome-assets/darkredmenu.png", "#420420", "#ffffff",
   homedir .. "Pictures/awesome-assets/darkredmenu-19x19.png",
   homedir .. "Pictures/awesome-assets/whitemenu-19x19.png"},
}

-- Default theme index, if the save file doesn't exist or doesn't work
local theme_index = 1

-- Load the current index from a file
local function load_theme_index()
  local file = io.open(saved_theme_file, "r")
  if file then
    theme_index = tonumber(file:read("*a")) or 1
    file:close()
    notify("Theme Change", "Loaded theme: " .. theme_index)
  else
    notify("Theme Change", "No theme file found, using default theme: " .. theme_index)
  end
end

-- Save the current index to a file
local function save_index()
  local file = io.open(saved_theme_file, "w")
  if file then
    file:write(tostring(theme_index))
    file:close()
  end
end

-- Function to save the theme and restart
local function change_theme_and_restart(index)
  theme_index = index
  save_index()
  awesome.restart()
end

-- Function that takes the keyboard input after {modkey + b} and changes theme based on the number
local function change_theme()
  awful.keygrabber.run(function(mod,key,event)
    if event == "press" then
      if key == "1" then
        change_theme_and_restart(1)
        return false
      elseif key == "2" then
        change_theme_and_restart(2)
        return false
      elseif key == "3" then
        change_theme_and_restart(3)
        return false
      elseif key == "4" then
        change_theme_and_restart(4)
        return false
      elseif key == "5" then
        change_theme_and_restart(5)
        return false
      elseif key == "6" then
        change_theme_and_restart(6)
        return false
      elseif key == "7" then
        change_theme_and_restart(7)
        return false
      elseif key == "8" then
        change_theme_and_restart(8)
        return false
      elseif key == "9" then
        change_theme_and_restart(9)
        return false
      end
    end
  end)
end

-- Load the saved thee color
load_theme_index()

-- Set the theme!
local icon_image                = themes[theme_index][1]
local theme_color               = themes[theme_index][2]
local rofi_border_color         = thmees[theme_index][2]
beautiful.border_focus          = themes[theme_index][2]
local fg_color_to_use           = themes[theme_index][3]
local squares_unsel_option      = themes[theme_index][4]
local squares_sel_empty_option  = themes[theme_index][4]
local squares_sel_option        = themes[theme_index][5]

-- Icon for the start menu
-- If you want to change it back, uncomment the line under default icon
-- and comment out the line above local icon_image
-- Default icon
--icon_image = beautiful.awesome_icon

--}}}


--{{{ Scratchpad
-- This is for the scratchpad, that opens a urxvt window that can be brought forward and hidden into the background.
-- There is a rule set further on, and a key binding set as well. Search "Scratchpad" to find them.

-- Function to toggle the scratchpad
local function toggle_scratchpad()
  local scratchpad_terminal = nil
  for _, client in pairs(client.get()) do
    if client.class == "URxvt" and client.instance == "scratchpad" then
      scratchpad_terminal = client
      break
    end
  end

  if scratchpad_terminal then
    if scratchpad_terminal.hidden then
      -- If terminal is hidden, show it
      scratchpad_terminal.hidden = false
      client.focus = scratchpad_terminal
    else
      -- If terminal is visible, hide it
      scratchpad_terminal.hidden = true
    end
  else
    -- If terminal doesn't exist, create it
    -- This is also where you can change the default size, just change geometry
    awful.spawn("urxvt -name scratchpad -geometry 100x35", false)
  end
end

--}}} End Scratchpad


-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
terminal2 = "gnome-terminal"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.max,
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.fair,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{
-- START BATTERY WIDGET
-- Create a text widget to display battery status
local battery_text = wibox.widget {
    widget = wibox.widget.textbox,
    align = "center",
    valign = "center",
    --font = "sans 10"
}

-- Add left padding using a margin container
local battery_widget_with_padding = wibox.container.margin(battery_text, 10, 5, 0, 0) -- 10 pixels of left padding and 5 right

-- Function to update the battery widget (Without Color)
--local function update_battery_widget()
    --awful.spawn.easy_async("acpi -b", function(stdout)
        --local status, charge = stdout:match("(%a+), (%d+%%)")
        --if status and charge then
            ---- Shorten the status
            --local short_status = (status:find("Charging") and "Cha" or "Dis")
            --battery_text.text = string.format("%s (%s)", charge, short_status)
        --else
            --battery_text.text = "N/A"
        --end
    --end)
--end

-- Function to update the battery widget (With Color)
local function update_battery_widget()
    awful.spawn.easy_async("acpi -b", function(stdout)
        local status, charge = stdout:match("(%a+), (%d+%%)")
        if status and charge then
            local short_status = (status:find("Charging") and "Cha" or "Dis")
            local charge_value = tonumber(charge:match("(%d+)")) -- Extract the numeric value

            -- Set text color based on charge level using pastel colors
            if charge_value >= 50 then
                battery_text.markup = "<span foreground='#8CC88C'>" .. string.format("%s (%s)", charge, short_status) .. "</span>" -- Pastel Green
            elseif charge_value >= 20 then
                battery_text.markup = "<span foreground='#E3C94C'>" .. string.format("%s (%s)", charge, short_status) .. "</span>" -- Pastel Yellow
            else
                battery_text.markup = "<span foreground='#FF6F61'>" .. string.format("%s (%s)", charge, short_status) .. "</span>" -- Pastel Coral
            end
        else
            battery_text.text = "N/A"
        end
    end)
end

-- Initial update
update_battery_widget()

-- Create a timer to update the widget every 10 seconds
local battery_timer = gears.timer {
    timeout = 10,
    autostart = true,
    callback = update_battery_widget
}

-- END BATTERY WIDGET
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "terminal", terminal },
                                  }
                        })

mylauncher = awful.widget.launcher({ image = icon_image,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
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

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ " ", " ", " ", " ", " ", " ", " ", " ", " " }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        style = {
          shape_border_width = 1,
          shape_border_color = theme_color,
          bg_focus = theme_color,
          squares_sel = squares_sel_option,
          squares_sel_empty = squares_sel_empty_option,
          squares_unsel = squares_unsel_option,
          --squares_unsel_empty = homedir .. "Pictures/awesome-assets/purplemenu-19x19.png",
          shape = function(cr) gears.shape.parallelogram(cr,14,19) end
        },
    }

    -- Add a margin to the left side of the taglist
    s.mytaglist_with_margin = wibox.container.margin(s.mytaglist,10,0,0,0)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        -- This gives rounded radius to tasklist
        style = {
          --shape_border_width = 1,
          --shape_border_color = '#ffffff',
          spacing = 10,
          bg_focus = theme_color,
          fg_focus = fg_color_to_use,
          shape = function(cr,w,h) gears.shape.rounded_rect(cr,w,h,8) end
        },
        widget_template = {
          {
            {
              id = "text_role",
              widget = wibox.widget.textbox,
            },
            left = 10, -- Adds 10 pixel of padding to left side of items in task list
            widget = wibox.container.margin,
          },
          id = "background_role",
          widget = wibox.container.background,
        },
    }

    -- Add padding to left side of tasklist
    s.mytasklist_with_margin = wibox.container.margin(s.mytasklist,10,0,0,0)

    -- Create the wibox
    s.mywibox = awful.wibar({ 
      position = "top", 
      screen = s,
      height = 20,
      border_width = 8,
      border_color = "#1d1f21",
      width = s.geometry.width-30,
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist_with_margin,
            s.mypromptbox,
        },
        s.mytasklist_with_margin, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mykeyboardlayout,
            battery_widget_with_padding,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(

    -- Volume Control
    awful.key({ }, "XF86AudioRaiseVolume", function ()
              awful.util.spawn("amixer set Master 5%+") end),
    awful.key({ }, "XF86AudioLowerVolume", function ()
              awful.util.spawn("amixer set Master 5%-") end),
    awful.key({ }, "XF86AudioMute", function ()
              awful.util.spawn("amixer sset Master toggle") end),

    -- Brightness Control
    awful.key({ }, "XF86MonBrightnessUp", function ()
              awful.util.spawn("xbacklight -inc 5") end),
    awful.key({ }, "XF86MonBrightnessDown", function ()
              awful.util.spawn("xbacklight -dec 5") end),

    -- Key combo to change theme colors
    awful.key({ modkey },            "b",     function () change_theme() end,
              {description = "+1-9 Change theme to 1-9",  group = "Custom"}),

    -- Scratchpad keybinding
    awful.key({ modkey },            "a", toggle_scratchpad,
              {description = "toggle scratchpad", group = "custom" }),

    -- Prompt
    awful.key({ modkey },            "d",     function () awful.spawn("rofi -show drun -font 'mono 10' -theme-str 'window{border-color: " .. rofi_border_color .. ";}'") end,
              {description = "Run rofi, a launcher for applications",  group = "launcher"}),


    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a urxvt terminal", group = "launcher"}),

    awful.key({ modkey, "Shift"   }, "t", function () awful.spawn(terminal2) end,
              {description = "open a gnome terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "e", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {

    -- Scratchpad rule
    { rule = { class = "URxvt", instance = "scratchpad" },
      properties = {
        ontop = true,
        sticky = true,
        skip_taskbar = true,
        focus = true,
        floating = true,
        titlebars_enabled = false,
      },
      callback = function(c)
        awful.placement.centered(c, { honor_workarea=true, honor_padding=true })
      end,
    },

    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}


-- Autorun program, stored in ~/.config/awesome/
awful.spawn.with_shell("~/.config/awesome/autorun.sh")


