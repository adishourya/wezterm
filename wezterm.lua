
-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices.
config.font = wezterm.font 'Simple Nerd Font'
config.font_size = 21
config.line_height = 2
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.show_new_tab_button_in_tab_bar = false
-- config.tab_max_width = 99

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}


-- keybindings

config.keys = {}

for i = 1, 8 do
  -- ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = act.ActivateTab(i - 1),
  })
end


local spawn_tab =  {
    key = 't', mods = 'ALT',
    action = act.SpawnTab 'CurrentPaneDomain',
  }


local split_horizontal = {
  key = '=', mods = 'ALT',
  action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
}

local split_vertical = {
  key = '-', mods = 'ALT',
  action = act.SplitVertical { domain = 'CurrentPaneDomain' },
}


local move_pane_up = {
  key = 'w', mods = 'ALT',
  action = act.ActivatePaneDirection 'Up',
}

local move_pane_left = {
  key = 'a', mods = 'ALT',
  action = act.ActivatePaneDirection 'Left',
}

local move_pane_down = {
  key = 's', mods = 'ALT',
  action = act.ActivatePaneDirection 'Down',
}

local move_pane_right = {
  key = 'd', mods = 'ALT',
  action = act.ActivatePaneDirection 'Right',
}



local resize_pane_left = {
  key = 'h', mods = 'ALT',
  action = act.AdjustPaneSize { 'Left', 2 },
}
local resize_pane_down = {
  key = 'j', mods = 'ALT',
  action = act.AdjustPaneSize { 'Down', 2 },
}
local resize_pane_up = {
  key = 'k', mods = 'ALT',
  action = act.AdjustPaneSize { 'Up', 2 },
}
local resize_pane_right = {
  key = 'l', mods = 'ALT',
  action = act.AdjustPaneSize { 'Right', 2 },
}

local maximize_split = {
  key = 'z', mods = 'ALT',
  action = act.TogglePaneZoomState,
}


table.insert(config.keys,spawn_tab)

table.insert(config.keys,split_horizontal)
table.insert(config.keys,split_vertical)

table.insert(config.keys, move_pane_up)
table.insert(config.keys, move_pane_left)
table.insert(config.keys, move_pane_down)
table.insert(config.keys, move_pane_right)

table.insert(config.keys, resize_pane_left)
table.insert(config.keys, resize_pane_down)
table.insert(config.keys, resize_pane_up)
table.insert(config.keys, resize_pane_right)

table.insert(config.keys, maximize_split)
return config
