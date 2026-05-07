local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.automatically_reload_config = true

-- ********** Exec ******************************************
config.default_prog = { 'wsl.exe', '--cd', '~/' }

config.launch_menu = { {
  label = 'New Tab (domain `Windows` - PowerShell)',
  args = { 'pwsh.exe' },
} }

-- ********** Layout *****************************************
config.color_scheme = 'Monokai Remastered'

config.font = wezterm.font('HackGen35 Console NF')
config.font_size = 14

-- Tab Layout
config.window_decorations = "RESIZE"

config.window_frame = {
  font_size = 8,
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}

config.enable_kitty_graphics = true

--Key Encoding
-- config.enable_kitty_keyboard = true
config.allow_win32_input_mode=false
-- ********** Key Config ***************************************************************
local act = wezterm.action

config.disable_default_key_bindings = true
config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = 'Enter',      mods = 'ALT',          action = act.ToggleFullScreen },

  { key = 'n',          mods = 'LEADER',       action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'n',          mods = 'LEADER',       action = act.SpawnTab 'CurrentPaneDomain' },

  { key = 'N',          mods = 'LEADER',       action = act.SpawnWindow },
  { key = 'N',          mods = 'ALT',       action = act.SpawnWindow },

  { key = 'n',        mods = 'ALT',         action = act.ActivateTabRelative(1) },
  { key = 'p',        mods = 'ALT',   action = act.ActivateTabRelative(-1) },

  { key = 's',          mods = 'ALT',  action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 's',          mods = 'LEADER',       action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 's',          mods = 'LEADER|CTRL',  action = act.SplitVertical { domain = 'CurrentPaneDomain' } },

  { key = 'v',          mods = 'ALT',  action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'v',          mods = 'LEADER',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'v',          mods = 'LEADER|CTRL',  action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },

  { key = 'q',          mods = 'ALT',       action = act.CloseCurrentPane { confirm = false } },
  { key = 'q',          mods = 'LEADER',       action = act.CloseCurrentPane { confirm = false } },
  { key = 'c',          mods = 'ALT',       action = act.CloseCurrentPane { confirm = false } },
  { key = 'c',          mods = 'LEADER',       action = act.CloseCurrentPane { confirm = false } },

  { key = 'r',          mods = 'LEADER',       action = act.RotatePanes 'CounterClockwise' },
  { key = 'o',          mods = 'LEADER',       action = act.TogglePaneZoomState },

  { key = 'PageUp',     mods = 'CTRL',         action = act.ActivateTabRelative(-1) },
  { key = 'PageDown',   mods = 'CTRL',         action = act.ActivateTabRelative(1) },

  { key = 'PageUp',     mods = 'SHIFT',        action = act.ScrollByPage(-1) },
  { key = 'PageDown',   mods = 'SHIFT',        action = act.ScrollByPage(1) },

  { key = 'PageUp',     mods = 'SHIFT|CTRL',   action = act.MoveTabRelative(-1) },
  { key = 'PageDown',   mods = 'SHIFT|CTRL',   action = act.MoveTabRelative(1) },


  { key = 'h',          mods = 'LEADER',       action = act.ActivatePaneDirection 'Left' },
  { key = 'l',          mods = 'LEADER',       action = act.ActivatePaneDirection 'Right' },
  { key = 'k',          mods = 'LEADER',       action = act.ActivatePaneDirection 'Up' },
  { key = 'j',          mods = 'LEADER',       action = act.ActivatePaneDirection 'Down' },

  { key = 'LeftArrow',  mods = 'LEADER',       action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'LEADER',       action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'LEADER',       action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'LEADER',       action = act.ActivatePaneDirection 'Down' },

  { key = 'h',          mods = 'SHIFT|LEADER', action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'l',          mods = 'SHIFT|LEADER', action = act.AdjustPaneSize { 'Right', 1 } },
  { key = 'k',          mods = 'SHIFT|LEADER', action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'j',          mods = 'SHIFT|LEADER', action = act.AdjustPaneSize { 'Down', 1 } },

  { key = 'H',          mods = 'LEADER',       action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'L',          mods = 'LEADER',       action = act.AdjustPaneSize { 'Right', 1 } },
  { key = 'K',          mods = 'LEADER',       action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'J',          mods = 'LEADER',       action = act.AdjustPaneSize { 'Down', 1 } },

  { key = 'LeftArrow',  mods = 'SHIFT|LEADER', action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'RightArrow', mods = 'SHIFT|LEADER', action = act.AdjustPaneSize { 'Right', 1 } },
  { key = 'UpArrow',    mods = 'SHIFT|LEADER', action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'DownArrow',  mods = 'SHIFT|LEADER', action = act.AdjustPaneSize { 'Down', 1 } },

  { key = '1',          mods = 'ALT',       action = act.ActivateTab(0) },
  { key = '2',          mods = 'ALT',       action = act.ActivateTab(1) },
  { key = '3',          mods = 'ALT',       action = act.ActivateTab(2) },
  { key = '4',          mods = 'ALT',       action = act.ActivateTab(3) },
  { key = '5',          mods = 'ALT',       action = act.ActivateTab(4) },
  { key = '6',          mods = 'ALT',       action = act.ActivateTab(5) },
  { key = '7',          mods = 'ALT',       action = act.ActivateTab(6) },
  { key = '8',          mods = 'ALT',       action = act.ActivateTab(7) },
  { key = '9',          mods = 'ALT',       action = act.ActivateTab(8) },

  { key = 'C',          mods = 'CTRL',         action = act.CopyTo 'Clipboard' },
  { key = 'C',          mods = 'SHIFT|CTRL',   action = act.CopyTo 'Clipboard' },
  { key = 'c',          mods = 'SHIFT|CTRL',   action = act.CopyTo 'Clipboard' },

  { key = 'V',          mods = 'CTRL',         action = act.PasteFrom 'Clipboard' },
  { key = 'V',          mods = 'SHIFT|CTRL',   action = act.PasteFrom 'Clipboard' },
  { key = 'v',          mods = 'SHIFT|CTRL',   action = act.PasteFrom 'Clipboard' },

  { key = 'P',          mods = 'CTRL',         action = act.ActivateCommandPalette },
  { key = 'P',          mods = 'SHIFT|CTRL',   action = act.ActivateCommandPalette },
  { key = 'p',          mods = 'SHIFT|CTRL',   action = act.ActivateCommandPalette },

  { key = 'F',          mods = 'LEADER',       action = act.Search 'CurrentSelectionOrEmptyString' },
  { key = 'f',          mods = 'LEADER',       action = act.Search 'CurrentSelectionOrEmptyString' },
}


config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = 	act.PasteFrom("Clipboard"),
  },
}

-- smart split
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

smart_splits.apply_to_config(config, {
  direction_keys = { "h", "j", "k", "l" },
  modifiers = {
    move = "ALT",
    resize = "ALT|SHIFT",
  },
})

return config
