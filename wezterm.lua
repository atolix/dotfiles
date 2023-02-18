local wezterm = require 'wezterm';
local act = wezterm.action;

return {
  font = wezterm.font 'Ricty Diminished',
  font_size = 14,
  use_ime = true,
  color_scheme = 'Sequoia Monochrome',
  adjust_window_size_when_changing_font_size = false,
  window_background_opacity = 0.95,
  leader = { key = '1', mods = 'CTRL', timeout_milliseconds = 2000 },
  keys = {
    {
      key = '|',
      mods = 'LEADER',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '%',
      mods = 'LEADER',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'LeftArrow',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'RightArrow',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'UpArrow',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'DownArrow',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Down',
    },
  },
}
